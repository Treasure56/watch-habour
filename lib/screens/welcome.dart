import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch_hub/screens/login.dart';
import 'package:watch_hub/screens/register.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(size * 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      image: CachedNetworkImageProvider(
                        "https://watchexchange.sg/wp-content/uploads/2023/06/luxury-watch-brands.jpg",
                      ),
                      fit: BoxFit.cover)),
              child: const AspectRatio(
                aspectRatio: 4 / 4.5,
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(size * 3),
                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                  const AppText.big(
                      "Watches for Every Style, Every Occasion"),
                  const SizedBox(height: 20),
                  const AppText.small(
                      "The WatchHarbor app is designed to offer a seamless and user-friendly platform for customers to explore, compare, and purchase a wide range of watches. "),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                          child: AppButton.primary(
                        onPressed: () => to(context, const RegisterScreen()),
                        child: "Create Account",
                      )),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                          child: AppButton.gradient(
                        onPressed: () => to(context, const LoginScreen()),
                        child: "Sign In",
                      )),
                    ],
                  )
                                  ],
                                ),
                ))
          ],
        ),
      ),
    );
  }
}
