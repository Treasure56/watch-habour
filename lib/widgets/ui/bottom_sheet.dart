import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet(
      {super.key,
      this.height,
      required this.child,
      required this.title,
      this.showCloseIcon = false});
  final double? height;
  final Widget child;
  final String title;
  final bool showCloseIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppDimensions.vh(context, 70, max: 250, min: 200),
      width: AppDimensions.vw(context, 100, max: 500),
      padding: const EdgeInsets.all(size * 3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppText.medium(
                  title,
                  size: size * 3,
                ),
                const Spacer(),
                if (showCloseIcon)
                  IconButton(
                      icon: Icon(Icons.close_rounded,
                          color: Theme.of(context).shadowColor),
                      onPressed: () {
                        back(context);
                      })
              ],
            ),
            const SizedBox(
              height: size * 3,
            ),
            Expanded(child: child)
          ]),
    );
  }
}
