import 'package:flutter/cupertino.dart';
import 'package:frontera/classes/Estimate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

typedef DevisCallBack = void Function(Estimate customer);
typedef EstimateCallBack = void Function(Estimate estimate);

class EstimateDisplay extends StatelessWidget {
  Estimate estimate;
  final EstimateCallBack deleteEstimate;

//  final DevisCallBack deleteCustomer;

  EstimateDisplay(this.estimate, this.deleteEstimate);

  List<DataRow> rowModule() {
    List<DataRow> myList = [];
    myList.add(DataRow(cells: [
      DataCell(Icon(Icons.delete, color: Colors.white), onTap: () {
        deleteEstimate(estimate);
      }),
      DataCell(Text(estimate.reference,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16))),
      DataCell(Text(estimate.taxfreeTotalPrice.toStringAsFixed(2),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16))),
      DataCell(Text(estimate.totalPriceIncTax.toStringAsFixed(2),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16))),
    ]));

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
            DataColumn(
                label: Text(
              '',
              textAlign: TextAlign.center,
            )),
            DataColumn(
                label: Text('Reference',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
            DataColumn(
                label: Text('Prix H.T',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
            DataColumn(
                label: Text('Prix TTC',
                    textAlign: TextAlign.center,
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
