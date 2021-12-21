import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/code/codeDialog.dart';
import 'package:forn_app/widgets/other/MyToast.dart' as myToast;
import 'package:forn_app/widgets/other/errorAlertDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globals.fToast = FToast();
    globals.fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Settings');
                },
                icon: const Icon(Icons.settings))
          ],
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 0,
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 25),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('صاج الدنيه منقوشه'),
                    ],
                    repeatForever: true,
                    pause: const Duration(seconds: 7),
                    // onTap: () {
                    //   print("Tap Event");
                    // },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
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
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyButton(
                            btnText: 'Order',
                            height: 150,
                            width: 150,
                            onPress: () {
                              orderMethod();
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyButton(
                            btnText: 'Gallery',
                            height: 150,
                            width: 150,
                            onPress: () {
                              Navigator.pushNamed(context, '/GalleryPage');
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyButton(
                            btnText: 'Menu',
                            height: 150,
                            width: 150,
                            onPress: () async {
                              // SharedPreferences localStorage =
                              //     await SharedPreferences.getInstance();
                              // localStorage.clear();
                              // print("cleaned");
                              myToast.showToast('There is no prices yet',
                                  const Icon(Icons.alarm));
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyButton(
                            btnText: 'About Us',
                            height: 150,
                            width: 150,
                            onPress: () {
                              Navigator.pushNamed(context, '/AboutUs');
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void orderMethod() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      print("hello");
      if ((localStorage.getString('Name').toString()) != 'null' &&
          (localStorage.getString('PhoneNb')) != 'null' &&
          (localStorage.getString('Location')) != 'null' &&
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
        Navigator.pushNamed(context, '/OrderPage');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => codeDialog()).then((exit) {

        });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorException));
    }
  }
}

// class secondPage extends StatelessWidget { //OrderPage
//   const secondPage({Key? key}) : super(key: key); //OrderPage
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
