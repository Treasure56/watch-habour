import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watch_habour/screens/notifications.dart';
import 'package:watch_habour/screens/settings/account_settings.dart';
import 'package:watch_habour/screens/welcome.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/ui/text.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size * 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.medium("My Account"),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView(children: [
              const SizedBox(height: 20),
              Column(children: [
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primary,
                  ),
                  child: const AppText.big(
                    "J",
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: size * 2),
                const AppText.small(
                  "John Doe",
                  weight: FontWeight.w500,
                  size: 16,
                )
              ]),
              const SizedBox(height: 20),
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
                        onTap: () => to(context, const AccountSettingsScreen()),
                        leading: const Icon(FontAwesomeIcons.user),
                        title: const AppText.small("Account Settings"),
                      ),
                      ListTile(
                        onTap: () => to(context, const NotificationsScreen()),
                        leading: const Icon(FontAwesomeIcons.bell),
                        title: const AppText.small("Notifications"),
                      ),
                      ListTile(
                        onTap: () {
                          allBackTo(context, const WelcomeScreen());
                        },
                        leading: const Icon(FontAwesomeIcons.arrowRightFromBracket,
                            color: Colors.red),
                        title: const AppText.small(
                          "Sign Out",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ))
            ]))
          ],
        ),
      ),
    );
  }
}
