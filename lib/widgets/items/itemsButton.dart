import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;

class ItemsButton extends StatefulWidget {
  var itemName;
  int itemQty;
  var onMinusTap;
  var onPlusTap;

  ItemsButton(
      {required this.itemName,
      required this.itemQty,
      required this.onMinusTap,
      required this.onPlusTap});

  @override
  _ItemsButtonState createState() => _ItemsButtonState();
}

class _ItemsButtonState extends State<ItemsButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 30,
          ),
          Row(
            children: [
              InkWell(
                child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    color: globals.blue,
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 18,
                          color: globals.blue_2,
                          fontWeight: FontWeight.bold),
                    )),
                onTap: () {
                  widget.onPlusTap();
                  if (widget.itemQty < 9999) {
                    setState(() {
                      widget.itemQty++;
                    });
                  }
                },
              ),

              Container(width: 70,
                  alignment: Alignment.center,
                  child: Text(widget.itemQty.toString())),

              InkWell(
                child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    color: globals.blue,
                    child: Text(
                      '-',
                      style: TextStyle(
                          fontSize: 22,
                          color: globals.blue_2,
                          fontWeight: FontWeight.bold),
                    )),
                onTap: () {
                  widget.onMinusTap();
                  if (widget.itemQty > 0) {
                    setState(() {
                      widget.itemQty--;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            width: 35,
          ),
          Container(
            width: 120,
            alignment: Alignment.center,
            child: Text(
              widget.itemName,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
