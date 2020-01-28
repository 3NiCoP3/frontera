import 'package:flutter/cupertino.dart';
import 'package:frontera/classes/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomerIdentity extends StatelessWidget {
  List<Customer> selectedCustomer;

  CustomerIdentity(this.selectedCustomer);

  List<DataRow> rowModule() {
    List<DataRow> myList = [];
    for (var i = 0; i < selectedCustomer.length; i++) {
      myList.add(DataRow(cells: [
        DataCell(Icon(Icons.delete, color: Colors.white)),
        DataCell(Text(selectedCustomer[i].lastName,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
        DataCell(Text(selectedCustomer[i].firstName.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
        DataCell(Text(selectedCustomer[i].emailAddress.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
      ]));
    }

    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black38,
          border: Border.all(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FittedBox(
          child: DataTable(columns: [
            DataColumn(label: Text('')),
            DataColumn(
                label: Text('Nom',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
            DataColumn(
                label: Text('Prénom',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
            DataColumn(
                label: Text('Email',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
          ], rows: rowModule()),
        ),
      ),
    );
  }
}
