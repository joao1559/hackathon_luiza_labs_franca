import 'package:flutter/material.dart';
import 'package:hackathon_luiza_labs_franca/screens/home.dart';
import 'package:hackathon_luiza_labs_franca/components/catalog_screen.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(10, 132, 251, 1),
    ),
    home: CatalogScreen()
  )
);
