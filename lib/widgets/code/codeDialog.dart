import 'package:flutter/material.dart';
import 'package:forn_app/widgets/code/sixCode.dart';

class codeDialog extends StatefulWidget {
  const codeDialog({Key? key}) : super(key: key);

  @override
  _codeDialogState createState() => _codeDialogState();
}

class _codeDialogState extends State<codeDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: sixCode(),
    );
  }
}
