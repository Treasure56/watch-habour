import 'package:flutter/material.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

enum AppSnackbarType { error, success, none }

class AppSnackbar extends StatelessWidget {
  const AppSnackbar(this.message,
      {super.key, this.messageType = AppSnackbarType.none});
  const AppSnackbar.error(this.message,
      {super.key, this.messageType = AppSnackbarType.error});
  const AppSnackbar.success(this.message,
      {super.key, this.messageType = AppSnackbarType.success});

  final String? message;
  final AppSnackbarType messageType;

  @override
  Widget build(BuildContext context) {
    return message == null
        ? const SizedBox()
        : Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
                horizontal: size * 2, vertical: size * .2),
            child: AppText.small(message!,
                size: size * 3,
                color: (messageType == AppSnackbarType.error
                    ? Colors.red[900]
                    : messageType == AppSnackbarType.none
                        ? Theme.of(context).shadowColor
                        : Colors.green[900]) as Color),
          );
  }
}
