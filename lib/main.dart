import 'package:flutter/material.dart';
import 'package:forn_app/page/aboutUs_page.dart';
import 'package:forn_app/page/first_page.dart';
import 'package:forn_app/page/gallery_page.dart';
import 'package:forn_app/page/menuPage.dart';
import 'package:forn_app/page/order_page.dart';
import 'package:forn_app/page/settingsProfile.dart';
import 'package:forn_app/page/splashPage.dart';
import 'package:forn_app/widgets/code/chooseDate.dart';
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
          title: 'صاج الدنيه منقوشه',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.amber,
            //highlightColor: Colors.amber.shade300,
          ),
          //home: FirstPage(),
          initialRoute: '/SplashPage',
          routes: {
            '/SplashPage': (context) => SplashPage(),
            '/FirstPage': (context) => FirstPage(),
            '/OrderPage': (context) =>OrderPage(),
            '/sixCode': (context)=>sixCode(),
            '/chooseDate': (context)=>chooseDate(),
            '/Settings': (context)=>settingsProfile(),
            '/AboutUs': (context)=>AboutUs(),
            '/GalleryPage': (context)=>GalleryPage(),
            '/MenuPage': (context)=>MenuPage(),
          });
    });
  }
}
