import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/code/codeDialog.dart';
import 'package:forn_app/widgets/other/errorAlertDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Settings');
              },
              icon: const Icon(Icons.settings))
        ], title: const Text('Forn_App'), centerTitle: true),
        body: Center(
          child: Column(
            children: [
              Center(
                child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Hello World'),
                    WavyAnimatedText('Look at the waves'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              )),
              Wrap(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: btn(
                          btnText: 'Order',
                          height: 150,
                          width: 150,
                        ),
                        onTap: () async {
                          try {
                            SharedPreferences localStorage =
                                await SharedPreferences.getInstance();
                            print("hello");
                            if ((localStorage.getString('Name').toString()) !=
                                    'null' &&
                                (localStorage.getString('PhoneNb')) != 'null' &&
                                (localStorage.getString('Location')) !=
                                    'null' &&
                                localStorage.getString('Name') != null &&
                                localStorage.getString('PhoneNb') != null &&
                                localStorage.getString('Location') != null &&
                                localStorage.getString('Name') != '' &&
                                localStorage.getString('PhoneNb') != '' &&
                                localStorage.getString('Location') != '') {
                              // localStorage.setString('Name', '');
                              // localStorage.setString('PhoneNb', '');
                              // localStorage.setString('Location', '');
                              print(localStorage.getString('Name'));
                              print(localStorage.getString('PhoneNb'));
                              print(localStorage.getString('Location'));
                              Navigator.pushNamed(context, '/SecondPage');
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      codeDialog()).then((exit) {
                                setState(() {
                                  //_nullTextCode();
                                });
                              });
                            }
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    ErrorAlertDialog(
                                        message: globals.errorException));
                          }
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: btn(btnText: 'Galery',
                          height: 150,
                          width: 150,),
                        onTap: () {},
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: btn(btnText: 'Menu',
                          height: 150,
                          width: 150,),
                        onTap: () {},
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}

// class secondPage extends StatelessWidget {
//   const secondPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         initialRoute: '/codeDialog',
//           routes: {
//             '/codeDialog': (context)=>codeDialog(),
//           }
//       );
//   }
// }

//
//
// import 'dart:js';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_client/globals/globals.dart';
//
// class firstPage extends StatelessWidget {
//   const firstPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteBlue,
//       body: Container(
//         child: Image(image: AssetImage('/Images/microsoft.jpg')),
//        // _nextpg();
//       ),
//     );
//   }
//   countDownTimer() async {
//     int timerCount;
//     for (int x = 5; x > 0; x--) {
//       await Future.delayed(Duration(seconds: 1)).then((_) {
//         setState(() {
//           timerCount -= 1;
//         });
//       });
//     }
//   }
// }
