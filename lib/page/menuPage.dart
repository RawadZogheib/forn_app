import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forn_app/api/my_api.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/PopUp/errorWarningPopup.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Widget> _children = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Menu',
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
                  // SizedBox(
                  //   height: 20,
                  //   width: MediaQuery.of(context).size.width,
                  // ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: _children,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loadMenu() async {
    try {
      var data = {
        'version': globals.version,
      };

      var res = await CallApi()
          .postData(data, 'Order/Control/(Control)getItemPrice.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        setState(() {
          for (int i = 0; i < body[1].length; i++) {
            _children.add(
              Container(
                height: 40,
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      alignment: Alignment.center,
                      child: Text(
                        body[1][i][0],
                        style: TextStyle(
                          color: globals.blue_1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      alignment: Alignment.center,
                      child: Text(
                        body[1][i][1],
                        style: TextStyle(
                          color: globals.blue_1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
      } else if (body[0] == "empty") {
        WarningPopup(context, 'No Item yet!!');
      } else if (body[0] == "errorVersion") {
        ErrorPopup(context, globals.errorVersion);
      } else {
        ErrorPopup(context, globals.errorElse);
      }
    } catch (e) {
      print(e);
      ErrorPopup(context, globals.errorException);
    }
  }
}
