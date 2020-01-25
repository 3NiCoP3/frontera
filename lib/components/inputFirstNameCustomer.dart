import 'package:flutter/material.dart';

class InputFirstNameCustomer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabled: false,
          filled: true,
          fillColor: Colors.black38,
          prefixIcon: Icon(Icons.person, color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          labelText: "Prénom",
        ),
      ),
    );
  }
}
