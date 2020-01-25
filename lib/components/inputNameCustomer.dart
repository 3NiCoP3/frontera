import 'package:flutter/material.dart';

typedef NameCallback = void Function(String name);

class InputNameCustomer extends StatelessWidget {

  final NameCallback onNameChoosed;
  final TextEditingController nameController = new TextEditingController();

  InputNameCustomer({this.onNameChoosed});

@override
Widget build(BuildContext context) {
  return Container(
    width: 190,
    child: TextField(
      controller: nameController,
      onSubmitted: (nameController) {
        onNameChoosed(nameController);
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabled: false,
        filled: true,
        fillColor: Colors.black38,
        prefixIcon: Icon(Icons.person, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        labelText: "Nom",
      ),
    ),
  );
}}
