import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_luiza_labs_franca/screens/product_info.dart';

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {

  String _code;

  Future _scan() async {
    try {
      String result = await BarcodeScanner.scan();
      setState(() {
        _code = result;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                ProductInfo(_code)));
      });
    } on PlatformException catch (e) {
    } on FormatException catch (e) {
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: new Image.asset('assets/qrcode.png'),
      tooltip: 'Ler QR code',
      onPressed: _scan,
    );
  }
}
