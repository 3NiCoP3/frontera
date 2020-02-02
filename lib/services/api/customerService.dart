import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:frontera/classes/customer.dart';
import 'api.dart';
import 'httpRequest.dart';

class CustomerService extends Api {
  static List<Customer> loadCustomers(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Customer>((json) => Customer.fromJson(json)).toList();
  }

  static getCustomers() async {
    var response = await Api.call(new HttpRequest(HttpVerb.get, "clients", {}));
    if (response.statusCode == 200) {
      List<Customer> customers = CustomerService.loadCustomers(response.body);

      return customers;
    } else
      new Text('Probléme récupération des clients');
  }

  static getCustomerById(int id)async{
    print("userId : " +id.toString());
    List<Customer> customers = await CustomerService.getCustomers();
    for (var i =0; i < customers.length; i++){
      print("customerId : "+ customers[i].id.toString());
      print(customers[i].id == id);
      if (customers[i].id == id){
        return customers[i];
      }
    }
  }
}
