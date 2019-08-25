import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/screens/updated_product_list.dart';
import 'package:hackathon_luiza_labs_franca/screens/catalog_screen.dart';

class DrawerAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Text('JM'),
                    radius: 35,
                  ),
                  Container(height: 12.0,),
                  Text("Jacob Moura", style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                  Text("jacobaraujo7@gmail.com", style: TextStyle(
                      color: Colors.white),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      CatalogScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Atualizar Produtos'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      UpdatedProductList()));
            },
          ),
        ],
      ),
    );
  }
}
