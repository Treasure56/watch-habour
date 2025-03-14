import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/ui/ui.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.textColor,
      this.hintText,
      this.keyboard,
      this.onChanged,
      this.label,
      this.obscureText,
      this.controller,
      this.validator,
      this.bgColor,
      this.borderColor,
      this.labelColor,
      this.textAlign = TextAlign.start,
      this.readOnly = false, this.onEditingComplete});

  final bool readOnly;
  final Color? textColor, bgColor, borderColor, labelColor;
  final String? hintText, label;
  final TextInputType? keyboard;
  final Function(String)? onChanged;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final Function()? onEditingComplete;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: size, bottom: size * .2),
            child: SizedBox(
                width: double.maxFinite,
                child: AppText.small(
                  widget.label!,
                  color: widget.labelColor ?? widget.textColor,
                )),
          ),
        Stack(children: [
          TextFormField(
            onEditingComplete: widget.onEditingComplete,
            readOnly: widget.readOnly,
            validator: widget.validator,
            textAlign: widget.textAlign,
            obscureText: widget.obscureText == null ? false : showPassword,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboard,
            controller: widget.controller,
            style: TextStyle(color: widget.textColor),
            cursorColor: widget.textColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: size * 2.2, horizontal: size * 2),
              filled: true,
              fillColor: widget.bgColor ??
                  Theme.of(context).colorScheme.inversePrimary,
              hintStyle: TextStyle(
                color: widget.textColor?.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: size * 2,
              ),
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(
                    size * 2)), // Set your desired corner radius
                borderSide: BorderSide(
                    color: widget.textColor ??
                        Theme.of(context).primaryColor,
                    width: 1), // This hides the default border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(
                    size * 2)), // Set your desired corner radius
                borderSide: BorderSide(
                    color: widget.textColor ?? Colors.black.withOpacity(.5),
                    width: 1), // This hides the default border
              ),
            ),
          ),
          if (widget.obscureText ?? false)
            Positioned(
              right: size,
              top: size * .8,
              child: IconButton(
                onPressed: () => setState(() {
                  showPassword = !showPassword;
                }),
                icon: Icon(
                  showPassword
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye,
                  size: size * 2.5,
                  color: widget.textColor?.withOpacity(.8) ??
                      Theme.of(context).shadowColor,
                ),
              ),
            )
        ]),
      ],
    );
  }
}
