import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../classes/customer.dart';
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class CustomersAutoComplete extends StatefulWidget {
  CustomersAutoComplete() : super();

  @override
  _CustomersAutoCompleteState createState() => _CustomersAutoCompleteState();
}

class _CustomersAutoCompleteState extends State<CustomersAutoComplete> {
  AutoCompleteTextField searchTextField;

  GlobalKey<AutoCompleteTextFieldState<Customer>> key = new GlobalKey();

  static List<Customer> customers = new List<Customer>();
  bool loading = true;

  void getCustomers() async {
    try {
      final response = await http.get("http://awesome-dev.eu:8090/clients");
      customers = loadCustomers(response.body);
      setState(() {
        loading = false;
      });
    } catch (e) {
      print("Error getting customers.");
    }
  }

  static List<Customer> loadCustomers(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Customer>((json) => Customer.fromJson(json)).toList();
  }

  @override
  void initState() {
    getCustomers();
    super.initState();
  }

  Widget row(Customer customer) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Nom : " + customer.firstName,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 3.0,
        ),
        Text(
          "Prénom : " + customer.lastName,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Email : " + customer.emailAddress,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          loading
              ? CircularProgressIndicator()
              : searchTextField = AutoCompleteTextField<Customer>(
                  key: key,
                  clearOnSubmit: true,
                  suggestions: customers,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black38,
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    labelText: 'Recherchez un nom de client ...',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3.0),
                        borderRadius: BorderRadius.circular(62.00)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(62.00)),
                  ),
                  itemFilter: (item, query) {
                    return item.lastName
                        .toLowerCase()
                        .startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    return a.lastName.compareTo(b.lastName);
                  },
                  itemSubmitted: (item) {
                    setState(() {
                      searchTextField.textField.controller.text =
                          item.lastName + item.firstName + item.emailAddress;
                    });
                  },
                  itemBuilder: (context, item) {
                    return row(item);
                  },
                ),
        ],
      ),
    );
  }
}
