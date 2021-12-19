import 'package:flutter/material.dart';
import 'package:forn_app/widgets/code/sixCode.dart';
import 'package:sizer/sizer.dart';

class codeDialog extends StatefulWidget {
  const codeDialog({Key? key}) : super(key: key);

  @override
  _codeDialogState createState() => _codeDialogState();
}

class _codeDialogState extends State<codeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 52.h, //300
        width: 70.w, //400
        child: ListView(padding: const EdgeInsets.all(8.0), children: const [
          sixCode(),
        ]),
      ),
    );
  }
}
