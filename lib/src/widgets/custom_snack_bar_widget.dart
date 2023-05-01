import 'package:flutter/material.dart';

class CustomSnackBarWidget extends SnackBar {
  CustomSnackBarWidget._({
    required this.widget,
    required this.message,
    required this.customBackgroundColor,
    required this.customDuration,
  }) : super(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              widget,
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 22),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          backgroundColor: customBackgroundColor,
          duration: customDuration,
        );

  final Widget widget;
  final String message;
  final Color customBackgroundColor;
  final Duration customDuration;

  CustomSnackBarWidget.forSucess(final String message)
      : this._(
          widget: const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          ),
          message: message,
          customBackgroundColor: Colors.green,
          customDuration: const Duration(milliseconds: 2400),
        );

  CustomSnackBarWidget.forError(final String message)
      : this._(
          widget: const Icon(
            Icons.cancel_outlined,
            color: Colors.white,
          ),
          message: message,
          customBackgroundColor: Colors.red,
          customDuration: const Duration(milliseconds: 2600),
        );
}