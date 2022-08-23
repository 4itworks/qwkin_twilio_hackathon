import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
        margin: EdgeInsets.only(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget marginSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      Container(
        margin: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );

  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );
}
