import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;
import 'package:forn_app/widgets/items/items.dart';
import 'package:forn_app/widgets/items/itemsButton.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Settings');
              },
              icon: const Icon(Icons.settings))
        ], title: const Text('Order'), centerTitle: true),
        backgroundColor: globals.whiteBlue,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.557,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
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
                        padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,4.0),
                        child: Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
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
                        padding: const EdgeInsets.fromLTRB(8.0,4.0,8.0,8.0),
                        child: Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
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
                                    "Coming soon",
                                    style: TextStyle(fontSize: 12,
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
            Expanded(
              child: ListView(
                children: widget.children2,
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
}
