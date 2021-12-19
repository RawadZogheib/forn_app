import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/button/myButton.dart';
import 'package:forn_app/widgets/items/items.dart';
import 'package:forn_app/widgets/items/itemsButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forn_app/widgets/other/MyToast.dart' as myToast;

class OrderPage extends StatefulWidget {
  int qtty = 0;
  final children = <Widget>[];
  final children2 = <Widget>[];
  List<String> names = [
    'زعتر',
    'كشك',
    'جبنة',
    'اورما',
    'زعتر اكسترا',
    'لبنة',
    'لبنة اكسترا',
    'لحمة',
    'لحمة صغيرة',
    'دزينة زعتر',
    'دزينة كشك',
    'دزينة جبنة',
    'دزينة لحمة',
    'طلمة بيتزا',
    'طلمة عادي'
  ];

  List<int> qty = [
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

  List<int> prices = [
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

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadButtons();
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
                                      children: widget.children,
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
                                            widget.qtty.toString(),
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
                          if (widget.qtty > 0) {
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
                              children: widget.children2,
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
    widget.children.clear();
    for (int i = 0; i < widget.names.length; i++) {
      if (widget.qty[i] > 0) {
        print("qty: " + widget.qty[i].toString());
        setState(() {
          widget.children
              .add(FornItem(itemName: widget.names[i], itemQty: widget.qty[i]));
        });
      }
    }
    print(widget.children);

    //  widget.children;
  }

  _loadButtons() {
    for (int i = 0; i < widget.names.length; i++) {
      widget.children2.add(ItemsButton(
        itemName: widget.names[i],
        itemQty: widget.qty[i],
        onMinusTap: () {
          if (widget.qty[i] > 0) {
            setState(() {
              widget.qty[i]--;
              widget.qtty--;
            });
            _loadList();
            print(widget.qty[i]);
          }
        },
        onPlusTap: () {
          if (widget.qty[i] < 9999) {
            setState(() {
              widget.qty[i]++;
              widget.qtty++;
            });
            _loadList();
            print(widget.qty[i]);
          }
        },
      ));
    } //End For
  }

  _beforeSendMail() {
    String txtMsg = '';

    for (int i = 0; i < widget.names.length; i++) {
      if (widget.qty[i] > 0) {
        txtMsg = txtMsg +
            '</br> ' +
            widget.names[i].toString() +
            ' x ' +
            widget.qty[i].toString() +
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
      widget.qtty = 0;
      widget.children.clear();
      widget.children2.clear();
    });
    widget.qty = [
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
    _loadButtons();
  }

}
