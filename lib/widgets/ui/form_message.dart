import 'package:flutter/material.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

enum FormMessageType { error, success }

class FormMessage extends StatelessWidget {
  const FormMessage.error(this.message,
      {super.key, this.messageType = FormMessageType.error});
  const FormMessage.success(this.message,
      {super.key, this.messageType = FormMessageType.success});

  final String? message;
  final FormMessageType messageType;

  @override
  Widget build(BuildContext context) {
    return message == null
        ? const SizedBox()
        : Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
                horizontal: size * 2, vertical: size * 1.5),
            decoration: BoxDecoration(
                color: messageType == FormMessageType.error
                    ? Colors.red[100]
                    : Colors.green[100],
                borderRadius: BorderRadius.circular(size * 2),
                border: Border.all(
                    width: 1,
                    color: (messageType == FormMessageType.error
                        ? Colors.red[200]
                        : Colors.green[200]) as Color)),
            child: AppText.small(message!,
                color: (messageType == FormMessageType.error
                    ? Colors.red[900]
                    : Colors.green[900]) as Color),
          );
  }
}
