import 'package:flutter/material.dart';

class AppDimensions {
  static double vh(context, v, {double? min, double? max}) {
    final a = MediaQuery.of(context).size.height / 100 * v;
    if (min != null && min > a) return min;
    if (max != null && max < a) return max;

    return a;
  }

  static double vw(context, v, {double? min, double? max}) {
    final a = MediaQuery.of(context).size.width / 100 * v;
    if (min != null && min > a) return min;
    if (max != null && max < a) return max;

    return a;
  }

  static double vs(context, v, {double? min, double? max}) {
    final a = ((MediaQuery.of(context).size.height +
                MediaQuery.of(context).size.width) /
            2) /
        100 *
        v;
    if (min != null && min > a) return min;
    if (max != null && max < a) return max;

    return a;
  }
}

const double size = 7;
const double minTabletWidth = 520;
