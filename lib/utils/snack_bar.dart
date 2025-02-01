import 'package:apple_shop/theme.dart';
import 'package:flutter/material.dart';

enum AlertType {
  success,
  error,
  warning,
}

void showCustomAlert(BuildContext context, String message,
    [AlertType alertType = AlertType.success]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: alertType == AlertType.success
          ? AppColor.greenColor
          : alertType == AlertType.warning
              ? AppColor.redColor
              : AppColor.redColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      content: Text(
        message,
        style: const TextStyle(
          fontFamily: 'Shabnam',
        ),
      ),
    ),
  );
}
