import { CodeBlock } from "@/accounts/components/CodeBlock";
import { Verify2FACodeForm } from "@/accounts/components/Verify2FACodeForm";
import { appHomeRoute } from "@/accounts/services/redirect";
import type { TwoFactorSecret } from "@/accounts/services/user";
import { enableTwoFactor, setupTwoFactor } from "@/accounts/services/user";
import { CenteredFill } from "@/base/components/containers";
import { LinkButton } from "@/base/components/LinkButton";
import { ActivityIndicator } from "@/base/components/mui/ActivityIndicator";
import { FocusVisibleButton } from "@/base/components/mui/FocusVisibleButton";
import { VerticallyCentered } from "@ente/shared/components/Container";
import { encryptWithRecoveryKey } from "@ente/shared/crypto/helpers";
import { getData, LS_KEYS, setLSUser } from "@ente/shared/storage/localStorage";
import { Paper, Stack, styled, Typography } from "@mui/material";
import { t } from "i18next";
import { useRouter } from "next/router";
import React, { useCallback, useEffect, useState } from "react";

const Page: React.FC = () => {
    const [twoFactorSecret, setTwoFactorSecret] = useState<
        TwoFactorSecret | undefined
    >();

    const router = useRouter();

    useEffect(() => {
        if (twoFactorSecret) return; // HMR
        void setupTwoFactor().then(setTwoFactorSecret);
    }, []);

    const handleSubmit = useCallback(async (otp: string) => {
        const recoveryEncryptedTwoFactorSecret = await encryptWithRecoveryKey(
            twoFactorSecret!.secretCode,
        );
        await enableTwoFactor(otp, recoveryEncryptedTwoFactorSecret);
        await setLSUser({
            ...getData(LS_KEYS.USER),
            isTwoFactorEnabled: true,
        });
    }, []);

    const handleSuccess = useCallback(() => {
        void router.push(appHomeRoute);
    }, [router]);

    return (
        <Stack sx={{ minHeight: "100svh" }}>
            <CenteredFill>
                <ContentsPaper>
                    <Typography variant="h5" sx={{ textAlign: "center" }}>
                        {t("two_factor")}
                    </Typography>
                    <Instructions twoFactorSecret={twoFactorSecret} />
                    <Verify2FACodeForm
                        onSubmit={handleSubmit}
                        onSuccess={handleSuccess}
                        submitButtonText={t("enable")}
                    />
                    <Stack sx={{ alignItems: "center" }}>
                        <FocusVisibleButton
                            variant="text"
                            onClick={router.back}
                        >
                            {t("go_back")}
                        </FocusVisibleButton>
                    </Stack>
                </ContentsPaper>
            </CenteredFill>
        </Stack>
    );
};

export default Page;

const ContentsPaper = styled(Paper)(({ theme }) => ({
    marginBlock: theme.spacing(2),
    padding: theme.spacing(4, 2),
    // Wide enough to fit the QR code secret in one line under default settings.
    width: "min(440px, 95vw)",
    display: "flex",
    flexDirection: "column",
    gap: theme.spacing(4),
}));

interface InstructionsProps {
    twoFactorSecret: TwoFactorSecret | undefined;
}

const Instructions: React.FC<InstructionsProps> = ({ twoFactorSecret }) => {
    const [setupMode, setSetupMode] = useState<"qr" | "manual">("qr");

    return (
        <VerticallyCentered sx={{ mb: 3, gap: 1 }}>
            {setupMode == "qr" ? (
                <SetupQRMode
                    twoFactorSecret={twoFactorSecret}
                    onChangeMode={() => setSetupMode("manual")}
                />
            ) : (
                <SetupManualMode
                    twoFactorSecret={twoFactorSecret}
                    onChangeMode={() => setSetupMode("qr")}
                />
            )}
        </VerticallyCentered>
    );
};

interface SetupManualModeProps {
    twoFactorSecret: TwoFactorSecret | undefined;
    onChangeMode: () => void;
}

const SetupManualMode: React.FC<SetupManualModeProps> = ({
    twoFactorSecret,
    onChangeMode,
}) => (
    <Stack sx={{ gap: 3 }}>
        <Typography sx={{ color: "text.muted" }}>
            {t("two_factor_manual_entry_message")}
        </Typography>
        <CodeBlock code={twoFactorSecret?.secretCode} />
        <LinkButton onClick={onChangeMode}>{t("scan_qr_title")}</LinkButton>
    </Stack>
);

interface SetupQRModeProps {
    twoFactorSecret?: TwoFactorSecret;
    onChangeMode: () => void;
}

const SetupQRMode: React.FC<SetupQRModeProps> = ({
    twoFactorSecret,
    onChangeMode,
}) => (
    <>
        <Typography sx={{ color: "text.muted" }}>
            {t("two_factor_qr_help")}
        </Typography>
        {!twoFactorSecret ? (
            <LoadingQRCode>
                <ActivityIndicator />
            </LoadingQRCode>
        ) : (
            <QRCode src={`data:image/png;base64,${twoFactorSecret?.qrCode}`} />
        )}
        <LinkButton onClick={onChangeMode}>
            {t("two_factor_manual_entry_title")}
        </LinkButton>
    </>
);

const QRCode = styled("img")(
    ({ theme }) => `
    height: 200px;
    width: 200px;
    margin: ${theme.spacing(2)};
`,
);

const LoadingQRCode = styled(VerticallyCentered)(
    ({ theme }) => `
    width: 200px;
    aspect-ratio:1;
    border: 1px solid ${theme.vars.palette.stroke.muted};
    margin: ${theme.spacing(2)};
    `,
);
