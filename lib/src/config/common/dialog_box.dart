import 'package:flutter/material.dart';

void showCustomAlert(BuildContext context, {
  required String title,
  required String content,
  required String action1Text,
  required VoidCallback onAction1,
  required String action2Text,
  required VoidCallback onAction2,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: onAction1,
            child: Text(action1Text),
          ),
          ElevatedButton(
            onPressed: onAction2,
            child: Text(action2Text),
          ),
        ],
      );
    },
  );
}