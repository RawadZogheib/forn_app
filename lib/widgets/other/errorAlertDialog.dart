import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;

class ErrorAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final double circularBorderRadius;
  final bool goHome;
  var onPress;

  ErrorAlertDialog({
    this.title = "Error",
    required this.message,
    this.circularBorderRadius = 8.0,
    this.goHome = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (onPress != null) {
              onPress();
            }
            if (goHome == true) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/Login', (route) => false);
            } else {
              Navigator.pop(context);
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}