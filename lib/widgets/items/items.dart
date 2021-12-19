import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;

class FornItem extends StatelessWidget {
  String itemName;
  int itemQty;

  FornItem({required this.itemName, required this.itemQty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: globals.blue, borderRadius: BorderRadius.circular(18.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(itemName),
            const SizedBox(
              width: 15,
            ),
            const Text('x'),
            const SizedBox(
              width: 15,
            ),
            Text(itemQty.toString()),
          ],
        ),
      ),
    );
  }
}
