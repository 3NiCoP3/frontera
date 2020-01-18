import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TestDataTable extends StatelessWidget {
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
            DataColumn(
                label: Text('Actions',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28))),
            DataColumn(
                label: Text('Modules',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28))),
            DataColumn(
                label: Text('Quantité',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28))),
            DataColumn(
                label: Text('Prix HT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28))),
            DataColumn(
                label: Text('TVA',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28))),
            DataColumn(
                label: Text('Prix TTC',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28))),
          ], rows: [
            DataRow(cells: [
              DataCell(Icon(Icons.delete, color: Colors.white)),
              DataCell(Text('ijaoieznoefzefzefzefioanzoiena',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24))),
              DataCell(Text('8',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24))),
              DataCell(Text('9000',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24))),
              DataCell(Text('20',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24))),
              DataCell(Text('10800',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24))),
            ]),
          ]),
        ),
      ),
    );
  }
}
