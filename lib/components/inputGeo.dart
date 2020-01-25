import 'package:flutter/material.dart';

class InputGeo extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _geoFilter = new TextEditingController();
  String _geo = "";
  InputGeo(this.text, this.width) {
    _geoFilter.addListener(_geoListen);
  }

  void _geoListen() {
    if (_geoFilter.text.isEmpty) {
      _geo = "";
    } else {
      _geo = _geoFilter.text;
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
