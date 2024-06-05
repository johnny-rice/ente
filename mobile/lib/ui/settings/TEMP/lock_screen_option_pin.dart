import "package:flutter/material.dart";
import "package:photos/generated/l10n.dart";
import "package:photos/theme/ente_theme.dart";
import "package:photos/ui/components/buttons/button_widget.dart";
import "package:photos/ui/components/buttons/icon_button_widget.dart";
import "package:photos/ui/components/models/button_type.dart";
import "package:photos/ui/settings/TEMP/lock_screen_option_confirm_pin.dart";
import "package:pinput/pin_put/pin_put.dart";

class LockScreenOptionPin extends StatefulWidget {
  const LockScreenOptionPin({super.key});

  @override
  State<LockScreenOptionPin> createState() => _LockScreenOptionPinState();
}

class _LockScreenOptionPinState extends State<LockScreenOptionPin> {
  final _pinController = TextEditingController(text: null);
  final _pinPutDecoration = BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(45, 194, 98, 1.0)),
    borderRadius: BorderRadius.circular(15.0),
  );
  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
  }

  String _code = "";
  Future<void> confirmPin(String code) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            LockScreenOptionConfirmPin(pin: code),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = getEnteColorScheme(context);
    final textTheme = getEnteTextTheme(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: ValueListenableBuilder(
                        valueListenable: _pinController,
                        builder: (context, value, child) {
                          return CircularProgressIndicator(
                            backgroundColor: colorTheme.fillStrong,
                            value: _pinController.text.length / 4,
                            color: colorTheme.primary400,
                            strokeWidth: 1.5,
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButtonWidget(
                      size: 30,
                      icon: Icons.lock_outline,
                      iconButtonType: IconButtonType.primary,
                      iconColor: colorTheme.tabIcon,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              S.of(context).enterThePinToLockTheApp,
              style: textTheme.bodyBold,
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: PinPut(
                fieldsCount: 4,
                controller: _pinController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: const Color.fromRGBO(45, 194, 98, 0.5),
                  ),
                ),
                inputDecoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  counterText: '',
                ),
                textStyle: textTheme.h3,
                obscureText: '*',
                onChanged: (String pin) {
                  setState(() {
                    _code = pin;
                  });
                },
                onSubmit: (value) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ButtonWidget(
                labelText: 'Next',
                buttonType: _code.length == 4
                    ? ButtonType.primary
                    : ButtonType.secondary,
                buttonSize: ButtonSize.large,
                onTap: () => confirmPin(_code),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 24)),
          ],
        ),
      ),
    );
  }
}
