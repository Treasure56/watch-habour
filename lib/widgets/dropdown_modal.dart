import 'package:watch_hub/utils/dimensions.dart';
import 'package:watch_hub/utils/navigation.dart';
import 'package:watch_hub/widgets/ui/text.dart';
import 'package:flutter/material.dart';

class DropdownModal extends StatelessWidget {
  const DropdownModal(
      {super.key,
      required this.items,
      required this.onSelect,
      required this.title,
      this.value});

  final List<String> items;
  final Function(String) onSelect;
  final String? value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.vh(context, 50),
      width: double.maxFinite,
      padding: const EdgeInsets.all(size * 3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          AppText.big(
            title,
            size: size * 2.5,
          ),
          const SizedBox(height: size * 2),
          Expanded(
            child: SingleChildScrollView(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...items.map((item) => TextButton(
                        onPressed: () {
                          onSelect(item);
                          back(context);
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context)
                                          .shadowColor
                                          .withOpacity(.6)))),
                          child: AppText.small(
                            item,
                            size: size * 2.2,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
