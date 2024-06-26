package user

import (
	"github.com/ente-io/museum/ente"
	"github.com/ente-io/museum/ente/details"
	bonus "github.com/ente-io/museum/ente/storagebonus"
	"github.com/ente-io/museum/pkg/utils/auth"
	"github.com/ente-io/museum/pkg/utils/recover"
	"github.com/ente-io/museum/pkg/utils/time"
	"github.com/ente-io/stacktrace"
	"github.com/gin-gonic/gin"
	"golang.org/x/sync/errgroup"
)

func (c *UserController) GetDetails(ctx *gin.Context) (details.UserDetailsResponse, error) {

	enteApp := ctx.MustGet("app").(ente.App)

	userID := auth.GetUserID(ctx.Request.Header)
	user, err := c.UserRepo.Get(userID)
	if err != nil {
		return details.UserDetailsResponse{}, stacktrace.Propagate(err, "")
	}
	usage, err := c.FileRepo.GetUsage(userID)
	if err != nil {
		return details.UserDetailsResponse{}, stacktrace.Propagate(err, "")
	}
	fileCount, err := c.FileRepo.GetFileCountForUser(userID, enteApp)
	if err != nil {
		return details.UserDetailsResponse{}, stacktrace.Propagate(err, "")
	}
	sharedCollectionsCount, err := c.CollectionRepo.GetSharedCollectionsCount(userID)
	if err != nil {
		return details.UserDetailsResponse{}, stacktrace.Propagate(err, "")
	}
	subscription, err := c.BillingController.GetSubscription(ctx, userID)
	if err != nil {
		return details.UserDetailsResponse{}, stacktrace.Propagate(err, "")
	}
	return details.UserDetailsResponse{
		Email:                  user.Email,
		Usage:                  usage,
		FileCount:              &fileCount,
		SharedCollectionsCount: &sharedCollectionsCount,
		Subscription:           subscription,
	}, nil
}

func (c *UserController) getUserFileCountWithCache(userID int64, app ente.App) (int64, error) {
	// Check if the value is present in the cache
	if count, ok := c.UserCache.GetFileCount(userID, app); ok {
		// Cache hit, update the cache asynchronously
		go func() {
			_, _ = c.getUserCountAndUpdateCache(userID, app)
		}()
		return count, nil
	}
	return c.getUserCountAndUpdateCache(userID, app)
}

func (c *UserController) getUserCountAndUpdateCache(userID int64, app ente.App) (int64, error) {
	count, err := c.FileRepo.GetFileCountForUser(userID, app)
	if err != nil {
		return 0, stacktrace.Propagate(err, "")
	}
	c.UserCache.SetFileCount(userID, count, app)
	return count, nil
}

func (c *UserController) GetDetailsV2(ctx *gin.Context, userID int64, fetchMemoryCount bool, app ente.App) (details.UserDetailsResponse, error) {

	g := new(errgroup.Group)
	var user *ente.User
	var familyData *ente.FamilyMemberResponse
	var subscription *ente.Subscription
	var canDisableEmailMFA bool
	var fileCount, sharedCollectionCount, usage int64
	var bonus *bonus.ActiveStorageBonus
	g.Go(func() error {
		resp, err := c.UserRepo.Get(userID)
		if err != nil {
			return stacktrace.Propagate(err, "failed to get user")
		}
		user = &resp
		bonusUserId := userID
		if user.FamilyAdminID != nil {
			bonusUserId = *user.FamilyAdminID
			familyDataResp, familyErr := c.FamilyController.FetchMembersForAdminID(ctx, *user.FamilyAdminID)
			if familyErr != nil {
				return stacktrace.Propagate(familyErr, "")
			}
			familyData = &familyDataResp
		}
		bonusValue, bonusErr := c.UserCacheController.GetActiveStorageBonus(ctx, bonusUserId)
		if bonusErr != nil {
			return stacktrace.Propagate(bonusErr, "failed to fetch storage bonus")
		}
		bonus = bonusValue
		return nil
	})

	g.Go(func() error {
		subResp, err := c.BillingController.GetSubscription(ctx, userID)
		if err != nil {
			return stacktrace.Propagate(err, "")
		}
		subscription = &subResp
		return nil
	})
	g.Go(func() error {
		isSRPSetupDone, err := c.UserAuthRepo.IsSRPSetupDone(ctx, userID)
		if err != nil {
			return stacktrace.Propagate(err, "")
		}
		canDisableEmailMFA = isSRPSetupDone
		return nil
	})
	g.Go(func() error {
		return recover.Int64ToInt64RecoverWrapper(userID, c.FileRepo.GetUsage, &usage)
	})

	if fetchMemoryCount {
		g.Go(func() error {
			fCount, err := c.getUserFileCountWithCache(userID, app)
			if err == nil {
				fileCount = fCount
			}

			return err
		})
	}

	// g.Wait waits for all goroutines to complete
	// and returns the first non-nil error returned
	// by one of the goroutines.
	if err := g.Wait(); err != nil {
		return details.UserDetailsResponse{}, stacktrace.Propagate(err, "")
	}
	var planStoreForBonusComputation = subscription.Storage
	if subscription.ExpiryTime < time.Microseconds() {
		planStoreForBonusComputation = 0
	}
	if familyData != nil {
		if familyData.ExpiryTime < time.Microseconds() {
			familyData.Storage = 0
		} else {
			planStoreForBonusComputation = familyData.Storage
		}
	}
	storageBonus := bonus.GetUsableBonus(planStoreForBonusComputation)
	var result = details.UserDetailsResponse{
		Email:        user.Email,
		FamilyData:   familyData,
		Subscription: *subscription,
		Usage:        usage,
		StorageBonus: storageBonus,
		ProfileData: &ente.ProfileData{
			CanDisableEmailMFA: canDisableEmailMFA,
			IsEmailMFAEnabled:  *user.IsEmailMFAEnabled,
			IsTwoFactorEnabled: *user.IsTwoFactorEnabled,
		},
		BonusData: bonus,
	}
	if fetchMemoryCount {
		result.FileCount = &fileCount
		// Note: SharedCollectionsCount is deprecated. Returning default value as 0
		result.SharedCollectionsCount = &sharedCollectionCount
	}
	return result, nil
}
