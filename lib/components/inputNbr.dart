import 'package:flutter/material.dart';

class InputNbr extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _nbrFilter = new TextEditingController();
  String _nbr = "";
  InputNbr(this.text, this.width) {
    _nbrFilter.addListener(_nbrListen);
  }

  void _nbrListen() {
    if (_nbrFilter.text.isEmpty) {
      _nbr = "";
    } else {
      _nbr = _nbrFilter.text;
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
