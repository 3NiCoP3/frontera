import 'package:flutter/material.dart';
import 'package:frontera/services/api/userService.dart';

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
        print(UserService.customer(nameController));
        onNameChoosed(nameController);
      },
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
        labelText: "Nom",
      ),
    ),
  );
}}
