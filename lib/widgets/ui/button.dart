import 'package:watch_hub/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:watch_hub/utils/theme.dart';
import 'package:watch_hub/widgets/widgets.dart';

enum AppButtonStyle { primary, secondary }

class AppButton extends StatelessWidget {
  const AppButton.primary({
    super.key,
    this.child,
    this.childSize = size * 2.2,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.bgColor,
    this.borderColor,
    this.textColor,
    this.gradientColors,
    this.height = size * 7,
    this.icon,
    this.iconBefore = false,
    this.loading = false,
    this.disabled = false,
    this.borderRadius,
    this.padding,
  });

  const AppButton.gradient({
    super.key,
    this.child,
    this.childSize = size * 2.2,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.bgColor,
    this.borderColor,
    this.textColor = AppColors.white,
    this.gradientColors = const [Colors.grey, Colors.grey],
    this.height = size * 7,
    this.icon,
    this.iconBefore = false,
    this.loading = false,
    this.disabled = false,
    this.borderRadius,
    this.padding,
  });

  final dynamic child;
  final Color? bgColor, borderColor, textColor;
  final List<Color>? gradientColors;
  final AppButtonStyle style;
  final Function() onPressed;
  final double height, childSize;
  final IconData? icon;
  final bool iconBefore, loading, disabled;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    List<Widget> iconAndSpace = [
      const SizedBox(
        width: 4,
      ),
      Icon(
        icon,
        color: (textColor ?? Theme.of(context).scaffoldBackgroundColor),
        size: childSize,
      )
    ];

    return Opacity(
      opacity: (loading || disabled) ? .6 : 1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: height,
        decoration: BoxDecoration(
          color: gradientColors != null
              ? gradientColors![0]
              : bgColor ??
                  (style == AppButtonStyle.primary
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark),
          borderRadius: borderRadius ?? BorderRadius.circular(size * 2),
          gradient: gradientColors == null
              ? null
              : LinearGradient(
                  colors: gradientColors!,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
          border: Border.all(
            width: 2,
            color: gradientColors != null
                ? Colors.transparent
                : borderColor ??
                    (style == AppButtonStyle.primary
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
          ),
        ),
        child: MaterialButton(
          padding: padding,
          minWidth: double.maxFinite,
          height: double.maxFinite,
          onPressed: (loading || disabled) ? null : onPressed,
          child: Loading(
            size: size * 2,
            color: textColor ?? AppColors.white,
            loading: loading,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: iconBefore ? TextDirection.rtl : null,
              children: [
                if (child is String) textWidget(context),
                if (icon != null) ...iconAndSpace.reversed,
                if (child is Widget) child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppText textWidget(BuildContext context) {
    return AppText.small(
      child,
      weight: FontWeight.w600,
      size: childSize,
      color: (textColor ?? Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
