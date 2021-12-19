import 'package:flutter/material.dart';

class myErrorText extends StatelessWidget {
  var errorText;
  var color;
  myErrorText({required this.errorText,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        errorText,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
