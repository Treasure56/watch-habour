import 'package:flutter/material.dart';
import 'package:watch_habour/screens/login.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              const AppText.big("Join WatchHabour"),
              const SizedBox(height: 20),
              const AppTextField(
                label: "Full Name",
                hintText: "John Doe",
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: "Phone Number",
                hintText: "+1 000 0000 000",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 12),
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
                onPressed: () => backTo(context, const LoginScreen()),
                child: "Sign Up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
