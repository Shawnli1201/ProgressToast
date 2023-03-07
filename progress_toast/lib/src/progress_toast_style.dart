import 'package:flutter/material.dart';

class ProgressToastStyle {
  const ProgressToastStyle(
      {this.textSize = 18.0,
      this.loadingSize = 18.0,
      this.margin = const EdgeInsets.all(15),
      this.padding = const EdgeInsets.all(15),
      this.safeAreaMinimum = EdgeInsets.zero,
      this.bgColor = Colors.transparent,
      this.toastBgColor = Colors.black,
      this.toastTextColor = Colors.white,
      this.toastDarkBgColor = Colors.white70,
      this.toastDarkTextColor = Colors.black87,
      this.duration = const Duration(seconds: 3),
      this.space = 15.0,
      this.messageMaxLine = 2});

  /// textsize for text
  final double textSize;

  /// size for loading widget
  final double loadingSize;

  /// toast margin
  final EdgeInsets margin;

  /// toast padding
  final EdgeInsets padding;

  /// overlay padding
  final EdgeInsets safeAreaMinimum;

  /// overlay background color
  final Color bgColor;

  /// toast background color
  final Color toastBgColor;

  /// text color
  final Color toastTextColor;

  /// toast background color in dark model
  final Color toastDarkBgColor;

  /// text color in dark model
  final Color toastDarkTextColor;

  /// duration for text dismiss
  final Duration duration;

  /// width between loading widget and text
  final double space;

  /// maxline for text
  final int messageMaxLine;
}
