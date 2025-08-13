import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

class ShowToast {
  static void toast(String msg, [String description = ""]) {
    toastification.show(
      // optional if you use ToastificationWrapper
      title: Text(msg),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      description: RichText(
        text: TextSpan(
          text: description,
          style: TextStyle(color: Colors.tealAccent),
        ),
      ),
    );
  }
}
