import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Checkout",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(size * 3),
              padding: const EdgeInsets.all(size * 2),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.small("Total Items"),
                        AppText.small(
                          "20",
                          weight: FontWeight.w600,
                        )
                      ]),
                  SizedBox(height: size),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.small("\$35, 000"),
                        AppText.small(
                          "20",
                          weight: FontWeight.w600,
                        )
                      ]),
                  SizedBox(height: size),
                  AppText.small(
                    "DELIVERY",
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: size),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.small("Period"),
                        AppText.small(
                          "14 days",
                          weight: FontWeight.w600,
                        )
                      ]),
                  SizedBox(height: size),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.small("Location"),
                        AppText.small(
                          "25 Main Street. San Francisco",
                          weight: FontWeight.w600,
                        )
                      ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(size * 3),
              child: AppButton.primary(
                onPressed: () {},
                child: "Complete Order",
              ),
            )
          ],
        ),
      ),
    );
  }
}
