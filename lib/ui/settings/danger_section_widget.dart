import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:photos/services/user_service.dart';
import 'package:photos/ui/settings/common_settings.dart';
import 'package:photos/ui/settings/settings_section_title.dart';
import 'package:photos/ui/settings/settings_text_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DangerSectionWidget extends StatefulWidget {
  const DangerSectionWidget({Key key}) : super(key: key);

  @override
  State<DangerSectionWidget> createState() => _DangerSectionWidgetState();
}

class _DangerSectionWidgetState extends State<DangerSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: const SettingsSectionTitle("Exit", color: Colors.red),
      collapsed: Container(),
      expanded: _getSectionOptions(context),
      theme: getExpandableTheme(context),
    );
  }

  Widget _getSectionOptions(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _onLogoutTapped();
          },
          child:
              const SettingsTextItem(text: "Logout", icon: Icons.navigate_next),
        ),
        sectionOptionDivider,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _onDeleteAccountTapped();
          },
          child: const SettingsTextItem(
            text: "Delete account",
            icon: Icons.navigate_next,
          ),
        ),
      ],
    );
  }

  Future<void> _onDeleteAccountTapped() async {
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Delete account",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      content: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Please send an email to ",
            ),
            TextSpan(
              text: "account-deletion@ente.io",
              style: TextStyle(
                color: Colors.orange[300],
              ),
            ),
            const TextSpan(
              text:
                  " from your registered email address.\n\nYour request will be processed within 72 hours.",
            ),
          ],
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.5,
            fontSize: 16,
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            "Send email",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop('dialog');
            try {
              final Email email = Email(
                recipients: ['account-deletion@ente.io'],
                isHTML: false,
              );
              await FlutterEmailSender.send(email);
            } catch (e) {
              launch("mailto:account-deletion@ente.io");
            }
          },
        ),
        TextButton(
          child: Text(
            "Ok",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _onLogoutTapped() async {
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Logout",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          child: const Text(
            "Yes, logout",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop('dialog');
            await UserService.instance.logout(context);
          },
        ),
        TextButton(
          child: Text(
            "No",
            style: TextStyle(
              color: Theme.of(context).buttonColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
