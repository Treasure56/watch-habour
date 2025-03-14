import 'package:flutter/material.dart';
import 'package:watch_hub/screens/home/home.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(size * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText.big("Sign In"),
              const SizedBox(height: 20),
              const AppTextField(
                label: "Email Address",
                hintText: "example@gmail.com",
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "Password",
                hintText: "enter password here",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              AppButton.primary(
                onPressed: () => allBackTo(context, const HomeScreen()),
                child: "Sign In",
              )
            ],
          ),
        ),
      ),
    );
  }
}
