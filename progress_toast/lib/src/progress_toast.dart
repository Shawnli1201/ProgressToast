import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_toast/src/progress_toast_style.dart';

enum ProgressToastType { loading, text }

class ProgressToast {
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;

  /// show loading toast
  static void loading(
      {required BuildContext context,
      Widget? customWidget,
      String? message,
      ProgressToastStyle? style}) {
    _showToast(context, message, customWidget, ProgressToastType.loading,
        style ?? const ProgressToastStyle());
  }

  /// show text toast
  static void text(
      {required BuildContext context,
      Widget? customWidget,
      String? message,
      ProgressToastStyle? style}) {
    _showToast(context, message, customWidget, ProgressToastType.text,
        style ?? const ProgressToastStyle());
  }

  /// dismiss all toast
  static Future<void> dismiss() async {
    _cancelToast();
  }

  static Future<void> _showToast(
      BuildContext context,
      String? message,
      Widget? customWidget,
      ProgressToastType type,
      ProgressToastStyle style) async {
    _cancelToast();
    _overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return ToastWidget(
        style: style,
        type: type,
        message: message,
        customWidget: customWidget,
      );
    });
    if (type == ProgressToastType.text) {
      _startTimer(style.duration);
    }
    final OverlayState overlayState = Overlay.of(context) as OverlayState;
    overlayState.insert(_overlayEntry!);
  }

  static void _startTimer(Duration duration) {
    _timer = Timer(duration, () {
      _cancelToast();
    });
  }

  static Future<void> _cancelToast() async {
    _timer?.cancel();
    _timer = null;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class ToastWidget extends StatelessWidget {
  const ToastWidget(
      {Key? key,
      required this.style,
      required this.type,
      this.message,
      this.customWidget})
      : super(key: key);
  final ProgressToastStyle style;
  final ProgressToastType type;
  final String? message;
  final Widget? customWidget;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: type != ProgressToastType.loading,
        child: SafeArea(
            minimum: style.safeAreaMinimum,
            child: Material(
              color: style.bgColor,
              child: Align(
                  child: Center(
                child: Container(
                  margin: style.margin,
                  padding: style.padding,
                  decoration: BoxDecoration(
                      color: _isDarkMode()
                          ? style.toastDarkBgColor
                          : style.toastBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: customWidget ?? _defalutToast(),
                ),
              )),
            )));
  }

  Widget _defalutToast() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (type == ProgressToastType.loading)
          SizedBox(
              width: style.loadingSize,
              height: style.loadingSize,
              child: CircularProgressIndicator(
                color: _isDarkMode()
                    ? style.toastDarkTextColor
                    : style.toastTextColor,
                strokeWidth: 2,
              )),
        if (type == ProgressToastType.loading &&
            message != null &&
            message!.isNotEmpty)
          SizedBox(width: style.space),
        if (message != null && message!.isNotEmpty)
          Flexible(
              child: Text(message!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: style.messageMaxLine,
                  style: TextStyle(
                    fontSize: style.textSize,
                    color: _isDarkMode()
                        ? style.toastDarkTextColor
                        : style.toastTextColor,
                  )))
      ],
    );
  }

  bool _isDarkMode() {
    bool isDarkMode;
    if (ThemeMode.system == ThemeMode.light ||
        ThemeMode.system == ThemeMode.dark) {
      isDarkMode = ThemeMode.system == ThemeMode.dark;
    } else {
      isDarkMode =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    }
    return isDarkMode;
  }
}
