import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timer/page/test.dart';
import 'package:timer/page/timer.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  final win = appWindow;
  final initialSize = Size(280, 460);
  win.minSize = initialSize;
  win.maxSize = initialSize;
  win.size = initialSize;
  win.alignment = Alignment.center;
  win.title = "Timer";
  win.show();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Timer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: FirstPage(),
          initialRoute: '/Timer',
          routes: {
            '/page1': (context) => MyTimer(),
          });
    });
  }
}
