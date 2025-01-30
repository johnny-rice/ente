import { Overlay } from "@/base/components/containers";
import type { ButtonishProps } from "@/base/components/mui";
import { UnstyledButton } from "@/new/photos/components/UnstyledButton";
import type { UserDetails } from "@/new/photos/services/user-details";
import {
    familyUsage,
    isPartOfFamilyWithOtherMembers,
} from "@/new/photos/services/user-details";
import { bytesInGB, formattedStorageByteSize } from "@/new/photos/utils/units";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
import CircleIcon from "@mui/icons-material/Circle";
import {
    Box,
    Skeleton,
    Stack,
    Typography,
    styled,
    useMediaQuery,
} from "@mui/material";
import { t } from "i18next";
import type React from "react";

interface SubscriptionCardProps {
    /**
     * Details for the logged in user.
     *
     * Can be undefined if the fetch has not yet completed.
     */
    userDetails: UserDetails | undefined;
    /**
     * Called when the user clicks on the card.
     */
    onClick: () => void;
}

/**
 * The card in the sidebar that shows a summary of the user's plan and usage.
 */
export const SubscriptionCard: React.FC<SubscriptionCardProps> = ({
    userDetails,
    onClick,
}) =>
    !userDetails ? (
        <Skeleton
            animation="wave"
            variant="rectangular"
            height={152}
            sx={{ borderRadius: "8px" }}
        />
    ) : (
        <Box sx={{ position: "relative", color: "fixed.white" }}>
            <BackgroundOverlay />
            <SubscriptionCardContentOverlay userDetails={userDetails} />
            <ClickOverlay onClick={onClick} />
        </Box>
    );

const BackgroundOverlay: React.FC = () => (
    <img
        style={{
            aspectRatio: "2/1",
            // Remove extra whitespace below the image.
            verticalAlign: "bottom",
        }}
        width="100%"
        src="/images/subscription-card-background/1x.png"
        srcSet="/images/subscription-card-background/2x.png 2x, /images/subscription-card-background/3x.png 3x"
    />
);

const ClickOverlay: React.FC<ButtonishProps> = ({ onClick }) => (
    <ClickOverlayButton onClick={onClick}>
        <ChevronRightIcon />
    </ClickOverlayButton>
);

/** A mixin of UnstyledButton and {@link Overlay}, plus custom styling. */
const ClickOverlayButton = styled(UnstyledButton)`
    /* Overlay */
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;

    /* Position the chevron at the middle right */
    display: flex;
    justify-content: flex-end;
    align-items: center;

    /* Reset the button color */
    color: inherit;
`;

interface SubscriptionCardContentOverlayProps {
    userDetails: UserDetails;
}

export const SubscriptionCardContentOverlay: React.FC<
    SubscriptionCardContentOverlayProps
> = ({ userDetails }) => (
    <Overlay>
        <Stack
            sx={{
                height: "100%",
                justifyContent: "space-between",
                padding: "20px 16px",
            }}
        >
            {isPartOfFamilyWithOtherMembers(userDetails) ? (
                <FamilySubscriptionCardContents userDetails={userDetails} />
            ) : (
                <IndividualSubscriptionCardContents userDetails={userDetails} />
            )}
        </Stack>
    </Overlay>
);

const IndividualSubscriptionCardContents: React.FC<
    SubscriptionCardContentOverlayProps
> = ({ userDetails }) => {
    const totalStorage =
        userDetails.subscription.storage + userDetails.storageBonus;

    return (
        <>
            <StorageSection storage={totalStorage} usage={userDetails.usage} />
            <IndividualUsageSection
                usage={userDetails.usage}
                fileCount={userDetails.fileCount}
                storage={totalStorage}
            />
        </>
    );
};

interface StorageSectionProps {
    usage: number;
    storage: number;
}

const StorageSection: React.FC<StorageSectionProps> = ({ usage, storage }) => {
    const isExtraSmallWidth = useMediaQuery("(width < 360px)");
    const label = isExtraSmallWidth
        ? `${bytesInGB(usage)} /  ${bytesInGB(storage)} ${t("storage_unit.gb")} ${t("used")}`
        : `${formattedStorageByteSize(usage, { round: true })} ${t("of")} ${formattedStorageByteSize(storage)} ${t("used")}`;

    return (
        <Box>
            <Typography variant="small" sx={{ opacity: 0.7 }}>
                {t("storage")}
            </Typography>
            <Typography variant="h3">{label}</Typography>
        </Box>
    );
};

interface UsageStorage {
    usage: number;
    storage: number;
}

type IndividualUsageSectionProps = UsageStorage & {
    fileCount: number;
};

const IndividualUsageSection: React.FC<IndividualUsageSectionProps> = ({
    usage,
    storage,
    fileCount,
}) => (
    // [Note: Fallback translation for languages with multiple plurals]
    //
    // Languages like Polish and Arabian have multiple plural forms, and
    // currently i18n falls back to the base language translation instead of the
    // "_other" form if all the plural forms are not listed out.
    //
    // As a workaround, name the _other form as the unprefixed name. That is,
    // instead of calling the most general plural form as foo_count_other, call
    // it foo_count (To keep our heads straight, we adopt the convention that
    // all such pluralizable strings use the _count suffix, but that's not a
    // requirement from the library).

    <Stack sx={{ gap: 1.5 }}>
        <UsageBar>
            <UsageBarSegment
                {...{ usage, storage }}
                fillColor="rgba(255 255 255 / 1)"
            />
        </UsageBar>
        <Stack direction="row" sx={{ justifyContent: "space-between" }}>
            <Typography variant="mini">
                {`${formattedStorageByteSize(storage - usage)} ${t("free")}`}
            </Typography>
            <Typography variant="mini" sx={{ fontWeight: "medium" }}>
                {t("photos_count", { count: fileCount ?? 0 })}
            </Typography>
        </Stack>
    </Stack>
);

const UsageBar = styled("div")`
    position: relative;
    height: 4px;
    border-radius: 4px;
    background-color: rgba(255 255 255 / 0.2);
`;

type UsageBarSegmentProps = UsageStorage & {
    /** A CSS color string representing the color that this segment  */
    fillColor: string;
};

/**
 * A bar inside a UsageContainer.
 */
const UsageBarSegment: React.FC<UsageBarSegmentProps> = ({
    usage,
    storage,
    fillColor,
}) => (
    <Box
        sx={{
            position: "absolute",
            left: 0,
            top: 0,
            width: "max(var(--width), 2px)",
            height: "4px",
            borderRadius: "4px",
            backgroundColor: "var(--background-color)",
        }}
        style={
            {
                "--width": `${Math.min(usage / storage, 1) * 100}%`,
                "--background-color": fillColor,
            } as React.CSSProperties
        }
    />
);

const FamilySubscriptionCardContents: React.FC<
    SubscriptionCardContentOverlayProps
> = ({ userDetails }) => {
    const usage = familyUsage(userDetails);
    const storage =
        (userDetails.familyData?.storage ?? 0) + userDetails.storageBonus;

    return (
        <>
            <StorageSection {...{ storage, usage }} />
            <FamilyUsageSection
                userUsage={userDetails.usage}
                fileCount={userDetails.fileCount}
                {...{ storage, usage }}
            />
        </>
    );
};

type FamilyUsageSectionProps = UsageStorage & {
    userUsage: number;
    fileCount: number;
};

const FamilyUsageSection: React.FC<FamilyUsageSectionProps> = ({
    usage,
    storage,
    userUsage,
    fileCount,
}) => (
    <Stack sx={{ gap: 1.5 }}>
        <UsageBar>
            <UsageBarSegment
                {...{ storage }}
                usage={userUsage}
                fillColor="rgba(255 255 255 / 1)"
            />
            <UsageBarSegment
                {...{ usage, storage }}
                fillColor="rgba(255 255 255 / 0.6)"
            />
        </UsageBar>
        <Stack direction="row" sx={{ justifyContent: "space-between" }}>
            <Stack direction="row" sx={{ gap: 1.5 }}>
                <Legend label={t("you")} opacity={1} />
                <Legend label={t("family")} opacity={0.8} />
            </Stack>
            <Typography variant="mini" sx={{ fontWeight: "medium" }}>
                {t("photos_count", { count: fileCount ?? 0 })}
            </Typography>
        </Stack>
    </Stack>
);

interface LegendProps {
    label: string;
    opacity: number;
}

const Legend: React.FC<LegendProps> = ({ label, opacity }) => (
    <Stack direction="row" sx={{ alignItems: "center", opacity }}>
        <LegendDot />
        <Typography variant="mini" sx={{ fontWeight: "medium" }}>
            {label}
        </Typography>
    </Stack>
);

const LegendDot = styled(CircleIcon)`
    font-size: 8.71px;
    margin: 0;
    margin-inline-end: 4px;
    color: inherit;
`;
