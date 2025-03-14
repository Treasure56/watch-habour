import 'package:watch_habour/utils/dimensions.dart';
import 'package:watch_habour/utils/navigation.dart';
import 'package:watch_habour/widgets/ui/text.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () => back(context),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    size: size * 1.8,
                  ),
                  const SizedBox(
                    width: size,
                  ),
                  AppText.small(
                    "Back",
                    size: size * 2,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
