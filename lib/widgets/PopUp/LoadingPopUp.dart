import 'package:flutter/material.dart';

LoadingPopUp(context){
  showDialog<Image>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Container(
        height: 150,
        width: 150,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Expanded(
              child: Image(
                image: AssetImage('Assets/krowl_logo2.png'),
              ),
            ),
            Text('Loading ...')          ],
        ),
      ),
    ),
  );
}
