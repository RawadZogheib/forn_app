
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/Settings');
        }, icon: const Icon(Icons.settings))
      ],
          title: const Text('Order'), centerTitle: true),
      body: Text('Welcomeee'),
    );
  }
}
