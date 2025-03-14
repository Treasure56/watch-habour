import 'package:flutter/material.dart';

Future<T?> showAppModal<T>(
  BuildContext context, {
  required Widget child,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  String? barrierLabel,
  Color? barrierColor,
  Duration? transitionDuration,
  RouteTransitionsBuilder? transitionBuilder,
}) async {
  return showDialog<T>(
    context: context,
    useRootNavigator: useRootNavigator,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor ?? Theme.of(context).shadowColor.withOpacity(.6),
    builder: (context) =>
        Material(type: MaterialType.transparency, child: Center(child: child)),
  );
}

Future<T?> showAppModalBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = true,
  bool isDismissible = true,
  bool enableDrag = true,
  double? closeProgressThreshold,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor:
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    barrierColor: barrierColor ?? Theme.of(context).shadowColor.withOpacity(.4),
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    builder: (context) => child,
  );
}
