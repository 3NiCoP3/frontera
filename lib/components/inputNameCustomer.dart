import 'package:flutter/material.dart';
import 'package:frontera/components/user.dart';
import 'package:frontera/devis_page.dart';

class InputNameCustomer extends StatelessWidget {
  String text;
  double width;

  final TextEditingController nameController = new TextEditingController();

  InputNameCustomer(this.text, this.width);

@override
Widget build(BuildContext context) {
  return Container(
    width: width,
    child: TextField(
      controller: nameController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black38,
        prefixIcon: Icon(Icons.search, color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelStyle: TextStyle(color: Colors.white),
        labelText: text,
      ),
    ),
  );
}}
