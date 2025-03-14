import 'package:flutter/material.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

class PasswordSettingsScreen extends StatefulWidget {
  const PasswordSettingsScreen({super.key});

  @override
  State<PasswordSettingsScreen> createState() => _PasswordSettingsScreenState();
}

class _PasswordSettingsScreenState extends State<PasswordSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Change Password",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(size * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(
                label: "Current Password",
                hintText: "enter current password",
                obscureText: true,
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "New Password",
                hintText: "enter new password",
                obscureText: true,
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "Confirm Password",
                hintText: "confirm new password",
                obscureText: true,
              ),
              const SizedBox(height: 12),
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
