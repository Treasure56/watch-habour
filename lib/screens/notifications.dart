import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Notifications",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size * 3.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const AppText.big(
              "You have no notifications",
              weight: FontWeight.w300,
            )
          ],
        ),
      ),
    );
  }
}
