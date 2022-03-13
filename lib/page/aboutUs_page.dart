import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'About Us',
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
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: globals.whiteBlue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    margin: const EdgeInsets.all(14.0),
                    padding:
                        const EdgeInsets.fromLTRB(24.0, 35.0, 24.0, 35.0),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number: ",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: globals.blue_1,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "+961 71 911 877",
                              style: TextStyle(
                                  color: globals.blue_2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email: ",
                              style: TextStyle(
                                  color: globals.blue_1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "denymanqoushi@gmail.com",
                              style: TextStyle(
                                  color: globals.blue_2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Adress: ",
                              style: TextStyle(
                                  color: globals.blue_1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Zabbougha  -  El Metn",
                              style: TextStyle(
                                  color: globals.blue_2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 222,
                        child: InkWell(
                          onTap: () {
                            _launchURL();
                          },
                          child: Container(
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
                                  image: AssetImage(
                                      'Assets/img/KwikCodeLogoPhone.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    if (!await launch(globals.url)) throw 'Could not launch ${globals.url}';
  }
}
