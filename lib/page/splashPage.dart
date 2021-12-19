import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:url_launcher/url_launcher.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.whiteBlue,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  height: 350,
                  width: 350,
                  image: AssetImage('Assets/img/logo.png'),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  _launchURL();
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Sponsored by',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Image(
                        height: 100,
                        width: 100,
                        image: AssetImage('Assets/img/KwikCodeLogoPhone.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _timer() async {
    try {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/FirstPage', (route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  _launchURL() async {
    if (!await launch(globals.url)) throw 'Could not launch ${globals.url}';
  }
}

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
