import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/textInput/myErrorText.dart';
import 'package:forn_app/widgets/textInput/myTextInput.dart';

// String errCode = '';
// Color colErrCode = globals.transparent;

class ChangeNbr extends StatefulWidget {
  const ChangeNbr({Key? key}) : super(key: key);

  @override
  _ChangeNbrState createState() => _ChangeNbrState();
}

class _ChangeNbrState extends State<ChangeNbr> {
  String errName = '';
  Color colErrName = globals.transparent;
  String qtyy = '';
  Color colName = globals.blue;
  Color colName_1 = globals.blue_1;
  Color colName_2 = globals.blue_2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //errCode = '';
    errName = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
    children: [

      const SizedBox(
        height: 5,
      ),
      myTextInput(
        keybType: const TextInputType.numberWithOptions(decimal: true),
        maxLength: 4,
        textString: 'Enter a number',
        labelText: 'Enter a number',
        spaceAllowed: false,
        obscure: false,
        colBlue: colName,
        colBlue_1: colName_1,
        colBlue_2: colName_2,
        onChange: (value) {
          qtyy = value;
        },
      ),
      myErrorText(errorText: errName, color: colErrName),
      const SizedBox(
        height: 10,
      ),
      InkWell(
        child: btn(
          btnText: 'OK',
          height: 50,
          width: 100,
        ),
        onTap: () {
          _check();
          //_sharedPref();
          //Navigator.pushNamed(context, '/FirstPage');
          //print(globals.sixCodeNb);
          //_checkCode();
        },
      ),
    ],
      )
    ]);
  }

  _check() {
    bool isEmpty = false;

    errName = '';
    colErrName = globals.transparent;

    if (qtyy != '') {
      setState(() {
        colName = Colors.amber.shade50;
        colName_1 = Colors.amber.shade900;
        colName_2 = Colors.amber.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colName = Colors.red.shade50;
        colName_1 = Colors.red.shade900;
        colName_2 = Colors.red.shade900.withOpacity(0.5);
        errName = globals.error7;
        colErrName = globals.red_1;
      });
    }


    if (isEmpty == false) {
      try{
      if(int.parse(qtyy) >= 0){
        setState(() {
          globals.qty[globals.tmpId] = int.parse(qtyy);
        });
      }
      }catch(e){
        print(e);
        print("./.");
      }
      Navigator.pop(context);
    }
  }
}
