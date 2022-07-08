//import 'package:flutter/cupertino.dart'; //CupertinoIcons.checkmark_alt_circle,//Success Icon
import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

ErrorPopup(BuildContext context, String? text) {
  MotionToast(
    icon: Icons.error,
    primaryColor: globals.red2,
    secondaryColor: globals.red1,
    toastDuration: const Duration(seconds: 3),
    backgroundType: BackgroundType.solid,
    title: const Text(
      'Error',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(
      text != null ? text : 'Unexpected Error.',
    ),
    position: MotionToastPosition.bottom,
    animationType: AnimationType.fromRight,
    height: 100,
  ).show(context);
}

WarningPopup(BuildContext context, String? text) {
  MotionToast(
    icon: Icons.warning,
    primaryColor: globals.yellow2,
    secondaryColor: globals.yellow1,
    toastDuration: const Duration(seconds: 3),
    backgroundType: BackgroundType.solid,
    title: const Text(
      'Warning',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(
      text != null ? text : 'Unexpected Warning.',
    ),
    position: MotionToastPosition.bottom,
    animationType: AnimationType.fromRight,
    height: 100,
  ).show(context);
}