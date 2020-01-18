import 'package:flutter/material.dart';

class InputDimension extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _dimensionFilter = new TextEditingController();
  String _dimension = "";
  InputDimension(this.text, this.width) {
    _dimensionFilter.addListener(_dimensionListen);
  }

  void _dimensionListen() {
    if (_dimensionFilter.text.isEmpty) {
      _dimension = "";
    } else {
      _dimension = _dimensionFilter.text;
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
