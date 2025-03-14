import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';
import 'package:oktoast/oktoast.dart';

class AppToast {
  static show(String msg) {
    showToast(msg,
        position: ToastPosition.bottom,
        backgroundColor: AppColors.dark,
        textStyle: const TextStyle(color: AppColors.lightBody));
  }

  static showError(String msg) {
    showToastWidget(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FormMessage.error(msg),
        ),
        position: ToastPosition.top);
  }

  static showSuccess(String msg) {
    showToastWidget(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FormMessage.success(msg),
        ),
        position: ToastPosition.top);
  }
}
