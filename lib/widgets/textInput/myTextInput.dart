import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forn_app/globals/globals.dart' as globals;

class myTextInput extends StatelessWidget {
  var textString;
  var onChange;
  var keybType;
  bool spaceAllowed;
  bool obscure;
  var maxLength;
  var maxLines;
  var colBlue, colBlue_1, colBlue_2;
  var textInputAction;
  var labelText;
  var prefixText;

  myTextInput(
      {required this.textString,
        required this.labelText,
        this.keybType,
        this.maxLength,
        this.maxLines,
        this.colBlue,
        this.colBlue_1,
        this.colBlue_2,
        this.textInputAction,
        this.prefixText,
        required this.spaceAllowed,
        required this.obscure,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      textAlign: TextAlign.left,
      cursorColor: Colors.black,
      style: TextStyle(color: globals.blue_1),
      decoration: InputDecoration(
          hintText: textString,
          hintStyle: TextStyle(fontSize: 14.0, color: colBlue_1),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colBlue),
              borderRadius: BorderRadius.circular(10.0)),
          filled: true,
          fillColor: colBlue,
          labelText: labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(fontSize: 14.0,color: colBlue_1),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colBlue_1),
              borderRadius: BorderRadius.circular(10)),
      prefixText: prefixText,
      ),
      textInputAction: textInputAction,
      keyboardType: keybType,
      obscureText: obscure,
      maxLength: maxLength,
      maxLines: maxLines,
      inputFormatters: [
        if(spaceAllowed == false)
          FilteringTextInputFormatter.deny(RegExp(r"\s")),
      ],);
  }
}