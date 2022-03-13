import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forn_app/api/my_api.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/PopUp/errorWarningPopup.dart';
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/code/sixCode.dart';
import 'package:forn_app/widgets/other/MyToast.dart' as myToast;
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  bool _loading = false;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 0,
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
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
                  padding: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: globals.whiteBlue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 312,
                        child: Wrap(
                          children: [
                            _loading == true
                                ? Column(
                                    children: [
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ],
                                  )
                                : Container(),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyButton(
                                  btnText: 'Order',
                                  height: 140,
                                  width: 140,
                                  onPress: () {
                                    if(_loading == false) {
                                      orderMethod();
                                    }
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyButton(
                                  btnText: 'Gallery',
                                  height: 140,
                                  width: 140,
                                  onPress: () {
                                    Navigator.pushNamed(
                                        context, '/GalleryPage');
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyButton(
                                  btnText: 'Menu',
                                  height: 140,
                                  width: 140,
                                  onPress: () async {
                                    // SharedPreferences localStorage =
                                    //     await SharedPreferences.getInstance();
                                    // localStorage.clear();
                                    // print("cleaned");
                                    // myToast.showToast('There is no prices yet',
                                    //     const Icon(Icons.alarm));
                                    Navigator.pushNamed(
                                        context, '/MenuPage');
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyButton(
                                  btnText: 'About Us',
                                  height: 140,
                                  width: 140,
                                  onPress: () {
                                    Navigator.pushNamed(context, '/AboutUs');
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void orderMethod() async {
    setState(() {
      _loading = true;
    });
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
        // print(localStorage.getString('Name'));
        // print(localStorage.getString('PhoneNb'));
        // print(localStorage.getString('Location'));

        var data = {
          'version': globals.version,
        };

        var res = await CallApi()
            .postData(data, '/Order/Control/(Control)checkClock.php');
        print(res.body);
        List<dynamic> body = json.decode(res.body);

        if (body[0] == "true") {
          Navigator.pushNamed(context, '/OrderPage');
        } else if (body[0] == "errorTime") {
          WarningPopup(context,
              'Sorry! Orders are only available from ${body[1]} to ${body[2]} ');
        } else if (body[0] == "errorVersion") {
          ErrorPopup(context, globals.errorVersion);
        } else {
          ErrorPopup(context, globals.errorElse);
        }
      } else {
        _open();
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      ErrorPopup(context, globals.errorException);
      print(e);
    }
    setState(() {
      _loading = false;
    });
  }
  _open() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.55,
            decoration: BoxDecoration(
              color: globals.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Icon(
                    Icons.keyboard_arrow_down,
                    size: 36,
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: sixCode(),
                    ),
                  ),
                ),
              ],
            ));
      },
    ).then((exit) {});
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
