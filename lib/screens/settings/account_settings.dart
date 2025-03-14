import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watch_hub/screens/settings/address_settings.dart';
import 'package:watch_hub/screens/settings/password_settings.dart';
import 'package:watch_hub/screens/settings/profile_settings.dart';
import 'package:watch_hub/utils/dimensions.dart';
import 'package:watch_hub/utils/navigation.dart';
import 'package:watch_hub/utils/theme.dart';
import 'package:watch_hub/widgets/widgets.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Account Settings",
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: size * 3.0),
          child: ListView(
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  // padding: const EdgeInsets.all(size * 2),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => to(context, const ProfileSettingsScreen()),
                        leading: const Icon(FontAwesomeIcons.user),
                        title: const AppText.small("Profile Settings"),
                      ),
                      ListTile(
                        onTap: () =>
                            to(context, const PasswordSettingsScreen()),
                        leading: const Icon(FontAwesomeIcons.lock),
                        title: const AppText.small("Password Settings"),
                      ),
                      ListTile(
                        onTap: () {
                          to(context, const AddressSettingsScreen());
                        },
                        leading: const Icon(
                          FontAwesomeIcons.locationDot,
                        ),
                        title: const AppText.small(
                          "Address Settings",
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
