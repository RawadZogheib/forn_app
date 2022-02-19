import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/PopUp/errorWarningPopup.dart';
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/calendarDate/myCalendarDate.dart';
import 'package:forn_app/widgets/code/dateDialog.dart';
import 'package:forn_app/widgets/items/items.dart';
import 'package:forn_app/widgets/items/itemsButton.dart';
import 'package:forn_app/widgets/other/MyToast.dart' as myToast;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/my_api.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    globals.qtty = 0;
    globals.price = 0;
    globals.qty.clear();
    globals.names.clear();
    globals.prices.clear();
    globals.children.clear();
    globals.children2.clear();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _cleanAll();
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
              'Order',
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
                  vertical: 20,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width * 0.557,
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: SingleChildScrollView(
                                    controller: ScrollController(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Wrap(
                                        children: globals.children,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 8.0, 4.0),
                                  child: Container(
                                      height: 95,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.amber.shade100,
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Quantity: ",
                                              style: TextStyle(
                                                  color: globals.blue_1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              globals.qtty.toString(),
                                              style: TextStyle(
                                                  color: globals.blue_1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 4.0, 8.0, 8.0),
                                  child: Container(
                                      height: 95,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.amber.shade100,
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Total Price: ",
                                              style: TextStyle(
                                                  color: globals.blue_1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              globals.price.toString(),
                                              //"There is no prices yet.",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: globals.blue_1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 8.0),
                      child: MyButton(
                        btnText: "Send",
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        onPress: () {
                          if (globals.qtty > 0) {
                            // _beforeSendMail();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    dateDialog()).then((exit) {
                              if (globals.send == true) {
                                globals.send = false;
                                _beforeSendMail();
                              } else {
                                setState(() {
                                  globals.send = false;
                                  _nullTextCode();
                                });
                              }
                            });
                          } else {
                            myToast.showToast(
                                'Choose some item before\n sending your order.',
                                const Icon(Icons.warning));
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(22.0, 8.0, 22.0, 0.0),
                        decoration: BoxDecoration(
                          color: globals.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22.0),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                              child: Wrap(
                                children: globals.children2,
                              ),
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
        ));
  }

  _loadList() {
    //print(widget.children);
    globals.qtty = 0;
    globals.price = 0;
    globals.children.clear();
    for (int i = 0; i < globals.names.length; i++) {
      if (globals.qty[i] > 0) {
        print("qty: " + globals.qty[i].toString());
        setState(() {
          globals.price = globals.price + globals.qty[i] * globals.prices[i];
          globals.qtty = globals.qtty + globals.qty[i];
          globals.children.add(
              FornItem(itemName: globals.names[i], itemQty: globals.qty[i]));
        });
      }
    }
    print(globals.children);
    //  widget.children;
  }

  _loadButtons() {
    for (int i = 0; i < globals.names.length; i++) {
      globals.children2.add(ItemsButton(
        id: i,
        itemName: globals.names[i],
        itemQty: globals.qty[i],
        onMinusTap: () {
          if (globals.qty[i] > 0) {
            setState(() {
              globals.qty[i]--;
              //globals.qtty--;
            });
            _loadList();
            print(globals.qty[i]);
          }
        },
        onPlusTap: () {
          if (globals.qty[i] < 9999) {
            setState(() {
              globals.qty[i]++;
              //globals.qtty++;
            });
            _loadList();
            print(globals.qty[i]);
          }
        },
        onMidTap: () {
          _loadList();
          print(globals.qty[i]);
        },
      ));
    } //End For
  }

  _beforeSendMail() {
    String txtMsg = '';

    for (int i = 0; i < globals.names.length; i++) {
      if (globals.qty[i] > 0) {
        txtMsg = txtMsg +
            ' ' +
            globals.names[i].toString() +
            '  x  ' +
            globals.qty[i].toString() +
            '<\/br>';
      }
    }
    _sendMail(txtMsg);
    setState(() {
      globals.qtty = 0;
      globals.price = 0;
      globals.children.clear();
      globals.children2.clear();
      for (int i = 0; i < globals.names.length; i++) {
        globals.qty[i] = 0;
      }
      _loadButtons();
    });
  }

  _sendMail(String txtMsg) async {
    //Send mail method
    //email sender: KwikCode@hotmail.com
    //email receiver: denymanqoushi@gmail.com

    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      String name = localStorage.getString('Name').toString();
      String PhoneNb = localStorage.getString('PhoneNb').toString();
      String Location = localStorage.getString('Location').toString();

      var data = {
        'version': globals.version,
        'name': name,
        'phoneNb': PhoneNb,
        'location': Location,
        'calendDate': globals.calendDate,
        'description': globals.description,
        'txtMsg': txtMsg,
        'price': globals.price
      };

      var res = await CallApi()
          .postData(data, 'sendMail/Control/(Control)sendMail.php');
      print(res);
      print(res.body);
      List<dynamic> body = json.decode(res.body);
      if (body[0] == 'true') {
        myToast.showToast('Email has been sent.', const Icon(Icons.email));
      } else {
        myToast.showToast('Message not sent.', const Icon(Icons.email));
        print('Message not sent.');
      }
      //print("pppppp");

      // String username = 'kwikcode@hotmail.com';
      // String password = "bati5meshwe";
      //
      // final smtpServer = hotmail(username, password);
      // // Use the SmtpServer class to configure an SMTP server:
      // // final smtpServer = SmtpServer('smtp.domain.com');
      // // See the named arguments of SmtpServer for further configuration
      // // options.
      //
      // // Create our message.
      // final message = Message()
      //   ..from = Address(username)
      //   ..recipients.add('denymanqoushi@gmail.com')
      //   //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      //   //..bccRecipients.add(Address('bccAddress@example.com'))
      //   ..subject = 'New Order'
      //   //..text = 'This is the plain text.\nThis is line 2 of the text part.'
      //   ..html =
      //       "<table bgcolor = '#FFFF8E'><tr style='color: #FFA000'><td><div style='color:#D35400'>Name:<\/div> " +
      //           name +
      //           "<br><div style='color:#D35400'>PhoneNumber:<\/div> " +
      //           PhoneNb +
      //           "<br><div style='color:#D35400'>Location:<\/div> " +
      //           Location +
      //           "<br><div style='color:#D35400'>Date To Receive Delivery:<\/div> " +
      //           globals.calendDate.toString() +
      //           "<br><div style='color:#D35400'>Description:<\/div> " +
      //           globals.description.toString() +
      //           "<\/br><\/br>" +
      //           "<\/td></tr><tr bgcolor = '#B7950B'><td style='color: white'>" +
      //           txtMsg +
      //           "<\/td></tr></table>";
      //
      // try {
      //   final sendReport = await send(message, smtpServer);
      //   myToast.showToast('Email has been sent.', const Icon(Icons.email));
      //   print('Message sent: ' + sendReport.toString());

      print('name: ' + name);
      print('PhoneNb: ' + PhoneNb);
      print('Location: ' + Location);
      print('txtMsg: ' + txtMsg);
    } catch (e) {
      myToast.showToast('Message not sent.', const Icon(Icons.email));
      print('Message not sent.');
    }
    // DONE
  }

  _cleanAll() async {
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
          globals.qtty = 0;
          globals.price = 0;
          globals.qty.clear();
          globals.names.clear();
          globals.prices.clear();
          globals.children.clear();
          globals.children2.clear();
          for (int i = 0; i < body[1].length; i++) {
            globals.qty.add(0);
            globals.names.add(body[1][i][0]);
            globals.prices.add(int.parse(body[1][i][1]));
          }
        });

        _loadButtons();
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

  _nullTextCode() {
    colDateCalendar = globals.blue;
    colDateCalendar_1 = globals.blue_1;
    colDateCalendar_2 = globals.blue_2;
    globals.description = '';
    globals.calendDate = '';
  }
}
