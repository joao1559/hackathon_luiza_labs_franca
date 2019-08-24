import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/components/magalu_bar.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _code;

  Future _scan() async {
    try {
      String result = await BarcodeScanner.scan();
      setState(() {
        _code = result;
      });
    } on PlatformException catch (e) {
//      print(e);
    } on FormatException catch (e) {
//      print(e);
    } catch (e) {
//      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mazaguine'),
        actions: <Widget>[
          IconButton(
            icon: new Image.asset('assets/qrcode.png'),
            tooltip: 'Ler QR code',
            onPressed: _scan,
          )
        ],
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
