import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/textInput/myErrorText.dart';
import 'package:forn_app/widgets/textInput/myTextInput.dart';
import 'package:shared_preferences/shared_preferences.dart';

RegExp phoneExp = new RegExp(r"[0-9]{8}\b");

// String errCode = '';
// Color colErrCode = globals.transparent;

class sixCode extends StatefulWidget {
  const sixCode({Key? key}) : super(key: key);

  @override
  _sixCodeState createState() => _sixCodeState();
}

class _sixCodeState extends State<sixCode> {
  String errName = '';
  Color colErrName = globals.transparent;
  String errPhone = '';
  Color colErrPhone = globals.transparent;
  String errLoc = '';
  Color colErrLoc = globals.transparent;
  String Name = '';
  String PhoneNb = '';
  String Location = '';
  Color colName = globals.blue;
  Color colName_1 = globals.blue_1;
  Color colName_2 = globals.blue_2;
  Color colPhone = globals.blue;
  Color colPhone_1 = globals.blue_1;
  Color colPhone_2 = globals.blue_2;
  Color colLocation = globals.blue;
  Color colLocation_1 = globals.blue_1;
  Color colLocation_2 = globals.blue_2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //errCode = '';
    errName = '';
    errPhone = '';
    errLoc = '';
  }

  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        children: [
      Column(
    children: [
      Text(
        "Insert the following fields",
        style: TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 15.0,
      ),
      myTextInput(
        initialValue: '',
        textString: 'Enter your Name',
        labelText: 'Enter your Name',
        spaceAllowed: true,
        enterAllowed: false,
        obscure: false,
        colBlue: colName,
        colBlue_1: colName_1,
        colBlue_2: colName_2,
        onChange: (value) {
          Name = value;
        },
      ),
      const SizedBox(
        height: 5,
      ),
      myErrorText(errorText: errName, color: colErrName),
      const SizedBox(
        height: 5,
      ),
      myTextInput(
        initialValue: '',
        textString: 'PhoneNumber',
        labelText: 'PhoneNumber',
        spaceAllowed: false,
        enterAllowed: false,
        obscure: false,
        colBlue: colPhone,
        colBlue_1: colPhone_1,
        colBlue_2: colPhone_2,
        keybType: const TextInputType.numberWithOptions(decimal: true),
        onChange: (value) {
          PhoneNb = value;
        },
      ),
      const SizedBox(
        height: 5,
      ),
      myErrorText(errorText: errPhone, color: colErrPhone),
      const SizedBox(
        height: 5,
      ),
      myTextInput(
        initialValue: '',
        textString: 'Your Location',
        labelText: 'Your Location',
        spaceAllowed: true,
        enterAllowed: false,
        obscure: false,
        colBlue: colLocation,
        colBlue_1: colLocation_1,
        colBlue_2: colLocation_2,
        onChange: (value) {
          Location = value;
        },
      ),
      const SizedBox(
        height: 5,
      ),
      myErrorText(errorText: errLoc, color: colErrLoc),
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
          //Navigator.pop(context);
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
    errPhone = '';
    colErrPhone = globals.transparent;
    errLoc = '';
    colErrLoc = globals.transparent;

    if (Name != '' && Name != null && Name != 'null') {
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
        errName = globals.warning7;
        colErrName = globals.red_1;
      });
    }

    if (PhoneNb != '' && PhoneNb != null && PhoneNb != 'null') {
      setState(() {
        colPhone = Colors.amber.shade50;
        colPhone_1 = Colors.amber.shade900;
        colPhone_2 = Colors.amber.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colPhone = Colors.red.shade50;
        colPhone_1 = Colors.red.shade900;
        colPhone_2 = Colors.red.shade900.withOpacity(0.5);
        errPhone = globals.warning7;
        colErrPhone = globals.red_1;
      });
    }

    if (Location != '' && Location != null && Location != 'null') {
      setState(() {
        colLocation = Colors.amber.shade50;
        colLocation_1 = Colors.amber.shade900;
        colLocation_2 = Colors.amber.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colLocation = Colors.red.shade50;
        colLocation_1 = Colors.red.shade900;
        colLocation_2 = Colors.red.shade900.withOpacity(0.5);
        errLoc = globals.warning7;
        colErrLoc = globals.red_1;
      });
    }

    if (isEmpty == false) {
      if(!phoneExp.hasMatch(PhoneNb)){
        setState(() {
          colPhone = globals.red;
          colPhone_1 = globals.red_1;
          colPhone_2 = globals.red_2;
          colErrPhone = globals.red_1;
          errPhone = globals.error400;
        });
      }else {
        _sharedPref();
        Navigator.pop(context);
        Navigator.pushNamed(context, '/OrderPage');
      }
    }
  }

  _sharedPref() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('Name', Name);
    localStorage.setString('PhoneNb', PhoneNb);
    localStorage.setString('Location', Location);
  }
}
