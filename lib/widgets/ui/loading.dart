import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading(
      {super.key,
      required this.loading,
      required this.child,
      this.size = 16,
      this.color});

  final bool loading;
  final Widget child;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return loading
        ? SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 2,
            ),
          )
        : child;
  }
}
