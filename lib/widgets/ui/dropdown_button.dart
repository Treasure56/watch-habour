import 'package:watch_hub/functions/modal.dart';
import 'package:watch_hub/utils/dimensions.dart';
import 'package:watch_hub/widgets/dropdown_modal.dart';
import 'package:watch_hub/widgets/ui/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDropdownButton extends StatefulWidget {
  const AppDropdownButton({
    super.key,
    this.label = "",
    this.value,
    required this.items,
    required this.onChanged,
    this.color,
    this.bgColor,
  });

  final String label;
  final String? value;
  final List<String> items;
  final Function(String) onChanged;
  final Color? color, bgColor;

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  String _value = "";
  @override
  void initState() {
    setState(() {
      _value = widget.value ?? widget.label;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(size * .5),
              width: double.maxFinite,
              child: AppText.small(
                widget.label,
                weight: FontWeight.w500,
                color: widget.color ??
                    Theme.of(context).shadowColor.withOpacity(.7),
              ),
            ),
            GestureDetector(
              onTap: () {
                showAppModalBottomSheet(context,
                    child: DropdownModal(
                      items: widget.items,
                      onSelect: (s) {
                        setState(() {
                          _value = s;
                        });
                        widget.onChanged(s);
                      },
                      title: widget.label,
                      value: _value,
                    ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: size * 2, vertical: size * 2.2),
                decoration: BoxDecoration(
                    color: widget.bgColor ??
                        Theme.of(context).shadowColor.withOpacity(.08),
                    border: Border.all(
                        width: 1,
                        color: widget.color ??
                            Theme.of(context).shadowColor.withOpacity(.4)),
                    borderRadius: BorderRadius.circular(size * 2)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.small(
                        _value,
                        color: _value == widget.label
                            ? widget.color?.withOpacity(.4) ??
                                Theme.of(context).shadowColor.withOpacity(.4)
                            : widget.color?.withOpacity(.8) ??
                                Theme.of(context).shadowColor.withOpacity(.8),
                        weight: FontWeight.w500,
                        size: size * 2.5,
                      ),
                      Icon(
                        FontAwesomeIcons.chevronDown,
                        color: widget.color ??
                            Theme.of(context).shadowColor.withOpacity(.7),
                      )
                    ]),
              ),
            )
          ],
        ),
      ],
    );
  }
}
