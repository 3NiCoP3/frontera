import 'package:flutter/material.dart';

class InputModule extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _moduleFilter = new TextEditingController();
  String _module = "";
  InputModule(this.text, this.width) {
    _moduleFilter.addListener(_moduleListen);
  }

  void _moduleListen() {
    if (_moduleFilter.text.isEmpty) {
      _module = "";
    } else {
      _module = _moduleFilter.text;
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
