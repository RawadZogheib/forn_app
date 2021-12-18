import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/button/myButton.dart';
import '../widgets/textInput/myErrorText.dart';
import '../widgets/textInput/myTextInput.dart';

RegExp phoneExp = new RegExp(r"[0-9]{8}\b");

class settingsProfile extends StatefulWidget {
  const settingsProfile({Key? key}) : super(key: key);

  @override
  _settingsProfileState createState() => _settingsProfileState();
}

class _settingsProfileState extends State<settingsProfile> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 28.0),
                  child: Text(
                    "Change your Informations",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                myTextInput(
                  textString: 'Enter your Name',
                  labelText: 'Enter your Name',
                  spaceAllowed: false,
                  obscure: false,
                  colBlue: colName,
                  colBlue_1: colName_1,
                  colBlue_2: colName_2,
                  onChange: (value) async {
                    Name = value;
                  },
                ),
                myErrorText(errorText: errName, color: colErrName),
                myTextInput(
                  textString: 'PhoneNumber',
                  labelText: 'PhoneNumber',
                  spaceAllowed: false,
                  obscure: false,
                  colBlue: colPhone,
                  colBlue_1: colPhone_1,
                  colBlue_2: colPhone_2,
                  onChange: (value) {
                    PhoneNb = value;
                  },
                ),
                myErrorText(errorText: errPhone, color: colErrPhone),
                myTextInput(
                  textString: 'Your Location',
                  labelText: 'Your Location',
                  spaceAllowed: false,
                  obscure: false,
                  colBlue: colLocation,
                  colBlue_1: colLocation_1,
                  colBlue_2: colLocation_2,
                  onChange: (value) {
                    Location = value;
                  },
                ),
                myErrorText(errorText: errLoc, color: colErrLoc),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      child: InkWell(
                    child: btn(btnText: 'OK'),
                    onTap: () {
                      _check();
                      //_sharedPref();
                      //Navigator.pushNamed(context, '/FirstPage');
                      //print(globals.sixCodeNb);
                      //_checkCode();
                    },
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
        colName = Colors.blue.shade50;
        colName_1 = Colors.blue.shade900;
        colName_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colName = Colors.red.shade50;
        colName_1 = Colors.red.shade900;
        colName_2 = Colors.red.shade900.withOpacity(0.5);
        errName = 'Field is Empty';
        colErrName = globals.red_1;
      });
    }

    if (PhoneNb != '' && PhoneNb != null && PhoneNb != '') {
      setState(() {
        colPhone = Colors.blue.shade50;
        colPhone_1 = Colors.blue.shade900;
        colPhone_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colPhone = Colors.red.shade50;
        colPhone_1 = Colors.red.shade900;
        colPhone_2 = Colors.red.shade900.withOpacity(0.5);
        errPhone = 'Field is Empty';
        colErrPhone = globals.red_1;
      });
    }

    if (Location != '' && Location != null && Location != '') {
      setState(() {
        colLocation = Colors.blue.shade50;
        colLocation_1 = Colors.blue.shade900;
        colLocation_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        colLocation = Colors.red.shade50;
        colLocation_1 = Colors.red.shade900;
        colLocation_2 = Colors.red.shade900.withOpacity(0.5);
        errLoc = 'Field is Empty';
        colErrLoc = globals.red_1;
      });
    }

    if (isEmpty == false) {
      if (!phoneExp.hasMatch(PhoneNb)) {
        setState(() {
          colPhone = globals.red;
          colPhone_1 = globals.red_1;
          colPhone_2 = globals.red_2;
          colErrPhone = globals.red_1;
          errPhone = "It's not a phoneNumber format, it must contain 8 numbers";
        });
      } else {
        _sharedPref();
        Navigator.pop(context);
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
