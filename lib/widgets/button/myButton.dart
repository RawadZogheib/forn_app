import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;

class btn extends StatelessWidget {
  var btnText;
  double? height;
  double? width;
  var onTap;

  btn({required this.btnText, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(btnText),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Colors.blue.shade200,
        ));
  }
}

class myButton extends StatelessWidget {
  var btnText;
  var height;
  var width;
  var onPress;

  myButton({required this.btnText, this.height, this.width, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: globals.blue,
        onPrimary: globals.blue_1,
        shadowColor: Colors.transparent,
        onSurface: Colors.orange,
        fixedSize: Size(50, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(btnText),
      onPressed: () {
        onPress();
        //print("Submitted2");
      },
    );
  }
}
