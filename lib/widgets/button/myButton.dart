import 'package:flutter/material.dart';
import 'package:forn_app/globals/globals.dart' as globals;

class btn extends StatelessWidget {
  var btnText;
  double? height;
  double? width;
  var onTap;

  btn({required this.btnText, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnText == 'Order' ? const Icon(Icons.upload, size: 40,) : Container(),
            btnText == 'Galery' ? const Icon(Icons.photo, size: 40,) : Container(),
            btnText == 'Menu' ? const Icon(Icons.book, size: 40,) : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(btnText,style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Colors.blue.shade200,
        ));
  }
}

class myButton extends StatelessWidget {
  var btnText;
  double height;
  double width;
  var onPress;

  myButton({required this.btnText, required this.height, required this.width, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue.shade200,
        onPrimary: globals.blue_1,
        shadowColor: Colors.transparent,
        fixedSize: Size(height, width),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnText == 'Order' ? const Icon(Icons.upload, size: 40,) : Container(),
            btnText == 'Gallery' ? const Icon(Icons.photo, size: 40,) : Container(),
            btnText == 'Menu' ? const Icon(Icons.book, size: 40,) : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(btnText,style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      onPressed: () {
        onPress();
        //print("Submitted2");
      },
    );
  }
}
