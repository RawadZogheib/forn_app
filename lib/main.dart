import 'package:flutter/material.dart';
import 'package:forn_app/page/FirstPage.dart';
import 'package:forn_app/page/PageTwo.dart';
import 'package:forn_app/widgets/code/codeDialog.dart';
import 'package:forn_app/widgets/code/sixCode.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Forn_App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: FirstPage(),
          initialRoute: '/FirstPage',
          routes: {
            '/FirstPage': (context) => FirstPage(),
            '/PageTwo': (context) =>PageTwo(),
            '/sixCode': (context)=>sixCode(),
            '/codeDialog': (context)=>codeDialog(),
          });
    });
  }
}
