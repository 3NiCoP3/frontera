import 'package:flutter/material.dart';

class InputGamme extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _gammeFilter = new TextEditingController();
  String _gamme = "";
  InputGamme(this.text, this.width) {
    _gammeFilter.addListener(_gammeListen);
  }

  void _gammeListen() {
    if (_gammeFilter.text.isEmpty) {
      _gamme = "";
    } else {
      _gamme = _gammeFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black38,
          prefixIcon: Icon(Icons.search, color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          labelStyle: TextStyle(color: Colors.white),
          labelText: text,
        ),
      ),
    );
  }
}
