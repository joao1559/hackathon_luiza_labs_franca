import 'package:flutter/material.dart';

class MagaluBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(252, 208, 0, 1),
                Color.fromRGBO(255, 138, 0, 1),
                Color.fromRGBO(255, 37, 58, 1),
                Color.fromRGBO(255, 55, 168, 1),
                Color.fromRGBO(164, 0, 225, 1),
                Color.fromRGBO(0, 134, 255, 1),
                Color.fromRGBO(0, 214, 4, 1),
              ]
          )
      ),
    );
  }
}
