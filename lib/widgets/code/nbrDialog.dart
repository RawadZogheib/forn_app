import 'package:flutter/material.dart';
import 'package:forn_app/widgets/code/changeNbr.dart';
import 'package:forn_app/widgets/code/sixCode.dart';
import 'package:sizer/sizer.dart';

class NbrDialog extends StatefulWidget {
  const NbrDialog({Key? key}) : super(key: key);

  @override
  _NbrDialogState createState() => _NbrDialogState();
}

class _NbrDialogState extends State<NbrDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 24.h, //300
        width: 70.w, //400
        child: ListView(padding: const EdgeInsets.all(8.0), children: const [
          ChangeNbr(),
        ]),
      ),
    );
  }
}
