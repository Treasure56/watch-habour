import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Profile Settings",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(size * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(
                label: "Full Name",
                hintText: "enter fullname",
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "Email Address",
                hintText: "example@gmail.com",
              ),
              const SizedBox(height: 20),
              AppButton.primary(
                onPressed: () => back(context),
                child: "Save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
