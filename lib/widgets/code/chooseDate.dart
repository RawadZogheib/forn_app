import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/textInput/myErrorText.dart';
import 'package:forn_app/widgets/textInput/myTextInput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:forn_app/widgets/calendarDate/myCalendarDate.dart';

RegExp phoneExp = new RegExp(r"[0-9]{8}\b");

// String errCode = '';
// Color colErrCode = globals.transparent;

class chooseDate extends StatefulWidget {
  const chooseDate({Key? key}) : super(key: key);

  @override
  _chooseDateState createState() => _chooseDateState();
}

class _chooseDateState extends State<chooseDate> {
  String errDate = '';
  Color colErrDate = globals.transparent;
  String errDesc = '';
  Color colErrDesc = globals.transparent;
  Color colDesc = globals.blue;
  Color colDesc_1 = globals.blue_1;
  Color colDesc_2 = globals.blue_2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //errCode = '';
    globals.calendDate = '';
    globals.description = '';
    errDate = '';
    errDesc = '';
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 28.0),
                child: Text(
                  "Last Step",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: myDateOfBirth(),
              ),
              const SizedBox(
                height: 5,
              ),
              myErrorText(errorText: errDate, color: colErrDate),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextInput(
                  textString: 'Description',
                  labelText: 'Description',
                  spaceAllowed: true,
                  obscure: false,
                  colBlue: colDesc,
                  colBlue_1: colDesc_1,
                  colBlue_2: colDesc_2,
                  maxLines: 5,
                  maxLength: 500,
                  keybType: const TextInputType.numberWithOptions(decimal: true),
                  onChange: (value) {
                    globals.description = value;
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              myErrorText(errorText: errDesc, color: colErrDesc),
              const SizedBox(
                height: 5,
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
        ]));
  }

  _check() {
    bool isEmpty = false;

    errDate = '';
    colErrDate = globals.transparent;
    errDesc = '';
    colErrDesc = globals.transparent;

    if (globals.calendDate != '' && globals.calendDate != null && globals.calendDate != 'null') {
      setState(() {
        colDateCalendar = Colors.amber.shade50;
        colDateCalendar_1 = Colors.amber.shade900;
        colDateCalendar_2 = Colors.amber.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colDateCalendar = Colors.red.shade50;
        colDateCalendar_1 = Colors.red.shade900;
        colDateCalendar_2 = Colors.red.shade900.withOpacity(0.5);
        errDate = globals.error7;
        colErrDate = globals.red_1;
      });
    }

    if (globals.description != '' && globals.description != null && globals.description != 'null') {
      setState(() {
        colDesc = Colors.amber.shade50;
        colDesc_1 = Colors.amber.shade900;
        colDesc_2 = Colors.amber.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colDesc = Colors.red.shade50;
        colDesc_1 = Colors.red.shade900;
        colDesc_2 = Colors.red.shade900.withOpacity(0.5);
        errDesc = globals.error7;
        colErrDesc = globals.red_1;
      });
    }

    if (isEmpty == false) {
        // _sharedPref();
        // Navigator.pop(context);
        // Navigator.pushNamed(context, '/OrderPage');
      globals.send = true;
      Navigator.pop(context);
      //_beforeSendMail();
    }
  }


}
