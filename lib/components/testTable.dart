import 'package:flutter/material.dart';

class TestTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3.0),
        child: Table(
          border: TableBorder.all(color: Colors.black, width: 2),
          children: [
            TableRow(
                decoration: BoxDecoration(color: Colors.black38),
                children: [
                  Text("Actions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  Text("Modules",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  Text("Quantité",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  Text("Prix HT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  Text("TVA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  Text("Prix TTC",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                ]),
            TableRow(
                decoration: BoxDecoration(color: Colors.black38),
                children: [
                  Icon(Icons.delete, color: Colors.white, size: 26),
                  Text("Mur kakak kejeje",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 3)),
                  Text("8",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 3)),
                  Text("8000",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 3)),
                  Text("20",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 3)),
                  Text("9600",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, height: 3)),
                ])
          ],
        ));
  }
}
