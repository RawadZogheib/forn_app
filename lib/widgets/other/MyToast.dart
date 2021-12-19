import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forn_app/globals/globals.dart' as globals;

showToast(String toastMsg, Icon icon) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.amber.shade100,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 12.0,
        ),
        Text(toastMsg),
      ],
    ),
  );

  globals.fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
