import 'package:flutter/material.dart';

class InputCompanyCustomer extends StatelessWidget {
  String text;
  double width;

  final TextEditingController _companyFilter = new TextEditingController();
  String _company = "";
  InputCompanyCustomer(this.text, this.width) {
    _companyFilter.addListener(_companyListen);
  }

  void _companyListen() {
    if (_companyFilter.text.isEmpty) {
      _company = "";
    } else {
      _company = _companyFilter.text;
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
