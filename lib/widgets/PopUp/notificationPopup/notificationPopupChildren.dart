import 'package:flutter/material.dart';

class NotificationPopupChildren extends StatefulWidget {
  const NotificationPopupChildren({Key? key}) : super(key: key);

  @override
  _NotificationPopupChildrenState createState() => _NotificationPopupChildrenState();
}

class _NotificationPopupChildrenState extends State<NotificationPopupChildren> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ print('sadsadsad');},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(4.0))
          ),
        ),
      ),
    );
  }
}
