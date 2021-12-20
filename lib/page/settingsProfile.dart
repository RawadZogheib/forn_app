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
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: globals.whiteBlue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Wrap(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            myTextInput(
                              textString: 'Enter your Name',
                              labelText: 'Enter your Name',
                              spaceAllowed: true,
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
                              height: 10,
                            ),
                            myTextInput(
                              textString: 'PhoneNumber',
                              labelText: 'PhoneNumber',
                              spaceAllowed: true,
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
                              height: 10,
                            ),
                            myTextInput(
                              textString: 'Your Location',
                              labelText: 'Your Location',
                              spaceAllowed: true,
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
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                  child: InkWell(
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
                              )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
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

    if (PhoneNb != '' && PhoneNb != null && PhoneNb != '') {
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
        errPhone = globals.error7;
        colErrPhone = globals.red_1;
      });
    }

    if (Location != '' && Location != null && Location != '') {
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
        errLoc = globals.error7;
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
          errPhone = globals.error400;
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
