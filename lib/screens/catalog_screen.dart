import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/components/color_loader.dart';
import 'package:hackathon_luiza_labs_franca/components/magalu_bar.dart';
import 'package:hackathon_luiza_labs_franca/components/drawer.dart';
import 'package:hackathon_luiza_labs_franca/components/qrcode.dart';
import 'package:hackathon_luiza_labs_franca/screens/product_info.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CatalogScreen> {
  Future<Map> _getProducts() async {
    http.Response response;

    response = await http.get(
        'https://hackthon-luizalabs-api.herokuapp.com/product');
    return json.decode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerAppBar(),
        appBar: AppBar(
//        centerTitle: true,
          title: Image.asset(
            'assets/magalu_logo.png',
            height: 24,
          ),
          actions: <Widget>[
            QrCode()
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              MagaluBar(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.network('https://www.meioemensagem.com.br/wp-content/uploads/2019/05/Magalu_SmartphonizaBrasil_575.jpg'),
              ),
              Expanded(
                child: FutureBuilder(
                    future: _getProducts(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Container(
                            width: 200.0,
                            height: 200.0,
                            alignment: Alignment.center,
                            child: ColorLoader(
                              colors: [
                                Color.fromRGBO(252, 208, 0, 1),
                                Color.fromRGBO(255, 138, 0, 1),
                                Color.fromRGBO(255, 37, 58, 1),
                                Color.fromRGBO(255, 55, 168, 1),
                                Color.fromRGBO(164, 0, 225, 1),
                                Color.fromRGBO(0, 134, 255, 1),
                                Color.fromRGBO(0, 214, 4, 1),
                              ],
                              duration: Duration(milliseconds: 1200),
                            ),
                          );
                        default:
                          if (snapshot.hasError)
                            return Container();
                          else
                            return _createGrid(context, snapshot);
                      }
                    }
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _createGrid(BuildContext context, AsyncSnapshot snapshot) {
    return RefreshIndicator(
      onRefresh: () {
        setState(() {

        });
      },
      child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1/1.3,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0, // espaçamento horizontal
              mainAxisSpacing: 10.0   // espaçamento vertical
          ),
          itemCount: snapshot.data['data'].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                height: 150,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Image.network(snapshot.data['data'][index]['image'], height: 130, width: 130,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(snapshot.data['data'][index]['name'],
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(snapshot.data['data'][index]['price'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        ProductInfo(snapshot.data['data'][index]['id'].toString())));
              },
            );
          }
      ),
    );
  }
}