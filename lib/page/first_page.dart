import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  late FToast fToast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

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
        ], centerTitle: true),
        backgroundColor: globals.whiteBlue,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  width: 300.0,
                  alignment: Alignment.center,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('صاج الدنيه منقوشه'),
                      ],
                      repeatForever: true,
                      pause: const Duration(seconds: 10),
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
              Wrap(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myButton(
                        btnText: 'Order',
                        height: 150,
                        width: 150,
                        onPress: () {
                          orderMethod();
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myButton(
                        btnText: 'Gallery',
                        height: 150,
                        width: 150,
                        onPress: (){
                          _showToast('Coming soon', const Icon(Icons.alarm));
                          // SharedPreferences localStorage = await SharedPreferences.getInstance();
                          // localStorage.clear();
                          // print("cleaned");
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myButton(
                        btnText: 'Menu',
                        height: 150,
                        width: 150,
                        onPress: () {
                          _showToast('Coming soon', const Icon(Icons.alarm));
                        },
                      )),
                ],
              ),
            ],
          ),
        ));
  }


  _showToast(String toastMsg, Icon icon) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blue.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            width: 12.0,
          ),
          Text(toastMsg),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: Duration(seconds: 2),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(
    //         child: child,
    //         top: 16.0,
    //         left: 16.0,
    //       );
    //     });
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
        Navigator.pushNamed(context, '/SecondPage');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => codeDialog()).then((exit) {
          setState(() {
            //_nullTextCode();
          });
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
