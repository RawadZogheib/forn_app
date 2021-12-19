import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/items/items.dart';
import 'package:forn_app/widgets/items/itemsButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forn_app/widgets/other/MyToast.dart' as myToast;

class OrderPage extends StatefulWidget {

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cleanAll();
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
        ], centerTitle: true, elevation: 0,),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.557,
                              decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: ListView(
                                  children: <Widget>[
                                    Wrap(
                                      children: globals.children,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                child: Container(
                                    height: 95,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.amber.shade100,
                                        borderRadius: BorderRadius.circular(22.0)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
                                child: Container(
                                    height: 95,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.amber.shade100,
                                        borderRadius: BorderRadius.circular(22.0)),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Total Price: ",
                                            style: TextStyle(
                                                color: globals.blue_1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            "There is no prices yet.",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
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
                            myToast.showToast('Email has been sent.', const Icon(Icons.email));
                            _beforeSendMail();
                          } else {
                            myToast.showToast('Choose some item before\n sending your order.',
                                const Icon(Icons.warning));
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(22.0,8.0,22.0,0.0),
                        padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,16.0),
                        decoration: BoxDecoration(
                          color: globals.white,
                          borderRadius: BorderRadius.circular(22.0)
                      ),
                        child: ListView(
                          children: [
                            Wrap(
                              children: globals.children2,
                            )
                          ],
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
    globals.children.clear();
    for (int i = 0; i < globals.names.length; i++) {
      if (globals.qty[i] > 0) {
        print("qty: " + globals.qty[i].toString());
        setState(() {
          globals.qtty = globals.qtty + globals.qty[i];
          globals.children
              .add(FornItem(itemName: globals.names[i], itemQty: globals.qty[i]));
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
            '</br> ' +
            globals.names[i].toString() +
            ' x ' +
            globals.qty[i].toString() +
            ' ';
      }
    }

    _sendMail(txtMsg);
    _cleanAll();
  }

  _sendMail(String txtMsg) async {
    //Send mail method
    //email sender: KwikCode@hotmail.com
    //email receiver: denymanqoushi@gmail.com

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String name = localStorage.getString('Name').toString();
    String PhoneNb = localStorage.getString('PhoneNb').toString();
    String Location = localStorage.getString('Location').toString();

    print('name: ' + name);
    print('PhoneNb: ' + PhoneNb);
    print('Location: ' + Location);
    print('txtMsg: ' + txtMsg);
  }

  _cleanAll() {
    setState(() {
      globals.qtty = 0;
      globals.children.clear();
      globals.children2.clear();
      globals.qty = [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ];
    });
    _loadButtons();
  }

}
