import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/components/color_loader.dart';
import 'package:hackathon_luiza_labs_franca/components/magalu_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProductInfo extends StatefulWidget {
  String _id;

  ProductInfo(id) {
    this._id = id;
  }

  @override
  _ProductInfoState createState() => _ProductInfoState(_id);
}

class _ProductInfoState extends State<ProductInfo> {
  String _id;
  bool _loading = true;
  Map<String, dynamic> _product;

  _ProductInfoState(id) {
    this._id = id;
  }

  @override
  void initState() {
    _getProduct().then((data) {
      setState(() {
        _product = data;
        _loading = false;
      });
    });
  }

  Future<Map> _getProduct() async {
    http.Response response = await http.get('https://hackthon-luizalabs-api.herokuapp.com/product/$_id');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            MagaluBar(),
            Expanded(
              child: !_loading ? ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          child: Image.network(_product['image']),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _product['name'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _product['price'],
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width,
                            height: 70,
                            child: RaisedButton(
                              child: Text(
                                'COMPRAR',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              color: Colors.green,
                              onPressed: () {
                                print('aj');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width,
                            height: 70,
                            child: RaisedButton(
                              child: Text(
                                'ADICIONAR A SACOLA',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              onPressed: () {
                                print('aj');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text('Descrição'),
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _product['description'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ) : Center(
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
              ),
            )
          ],
        ),
      )
    );
  }
}
