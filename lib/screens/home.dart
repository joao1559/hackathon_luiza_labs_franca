import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/components/magalu_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mazaguine')
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            MagaluBar(),
          ],
        ),
      )
    );
  }
}
