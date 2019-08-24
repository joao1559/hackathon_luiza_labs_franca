import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/components/magalu_bar.dart';
import 'package:hackathon_luiza_labs_franca/components/drawer.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAppBar(),
      appBar: AppBar(
          title: Text('Magazuine Luiza')
      ),
        body: Container(
          child: Column(
            children: <Widget>[
              MagaluBar()
            ],
          ),
        )
    );
  }
}
