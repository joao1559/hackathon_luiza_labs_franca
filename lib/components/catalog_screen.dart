import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/components/magalu_bar.dart';
import 'package:hackathon_luiza_labs_franca/components/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CatalogScreen> {
  Future<Map> _getProducts() async {
    http.Response response;

//    response = await http.get(
//        'https://api.giphy.com/v1/gifs/trending?api_key=HACztj0GDk6TgF7RvKjRwRIygczzXwPM&limit=20&rating=G');
//    return json.decode(response.body);

    response = await http.get(
        'https://hackthon-luizalabs-api.herokuapp.com/product');
    return json.decode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    _getProducts().then((map) {
//      print(map);
//    });
  }

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
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                              strokeWidth: 5.0,
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
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0, // espaçamento horizontal
            mainAxisSpacing: 10.0   // espaçamento vertical
        ),
        itemCount: snapshot.data['data'].length,
//        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector( // permite clicar na imagem
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.network(snapshot.data['data'][index]["image"], height: 130, width: 130,),
                    Text('Descrição do produtsdsds dsdsdsdsds sdsdsdsdsd', textAlign: TextAlign.left, style: TextStyle(height: 1),),
                    Text('RS 1200')
                  ],
                )
              ),
            )
//            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) =>
//                      GifPage(snapshot.data['data'][index])));
//            },
          );
        }
    );
  }
}
