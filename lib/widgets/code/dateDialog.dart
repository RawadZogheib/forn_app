import 'package:flutter/material.dart';
import 'package:forn_app/widgets/code/sixCode.dart';
import 'package:sizer/sizer.dart';

import 'package:forn_app/widgets/code/chooseDate.dart';

class dateDialog extends StatefulWidget {
  const dateDialog({Key? key}) : super(key: key);

  @override
  _dateDialogState createState() => _dateDialogState();
}

class _dateDialogState extends State<dateDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 35.h, //300
        width: 40.w, //400
        child: ListView(padding: const EdgeInsets.all(8.0), children: const [
          chooseDate(),
        ]),
      ),
    );
  }
}
