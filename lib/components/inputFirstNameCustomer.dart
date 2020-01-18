import 'package:flutter/material.dart';

class InputFirstNameCustomer extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _firstNameFilter = new TextEditingController();
  String _firstName = "";
  InputFirstNameCustomer(this.text, this.width) {
    _firstNameFilter.addListener(_firstNameListen);
  }

  void _firstNameListen() {
    if (_firstNameFilter.text.isEmpty) {
      _firstName = "";
    } else {
      _firstName = _firstNameFilter.text;
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
