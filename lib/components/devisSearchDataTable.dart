import 'package:flutter/cupertino.dart';
import 'package:frontera/classes/Estimate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/services/api/EstimateService.dart';

typedef EstimateCallBack = void Function(Estimate estimate);

class DevisSearchDataTable extends StatelessWidget {
  List<Estimate> selectedEstimate;
  final EstimateCallBack deleteEstimate;

  DevisSearchDataTable(this.selectedEstimate, this.deleteEstimate);

  _modules(String reference) async {
    var estimates = await EstimateService.getEstimates();
    for (var i = 0; i < estimates.length; i++) {
      if (reference == estimates[i].reference){
        return estimates[i].modules;
      }
//      for (var a = 0; a < estimates[i].modules.length; a++) {
//        print(estimates[i].modules[a].name);
//        return estimates[i].modules[a].name;
//      }
    }
  }

  List<DataRow> rowDevis() {
    List<DataRow> myList = [];
    for (var i = 0; i < selectedEstimate.length; i++) {
      myList.add(DataRow(cells: [
        DataCell(Icon(Icons.delete, color: Colors.white), onTap: () {
          deleteEstimate(selectedEstimate[i]);
        }),
        DataCell(Text(selectedEstimate[i].modules.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
        DataCell(Text(selectedEstimate[i].taxfreeTotalPrice.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
        DataCell(Text(selectedEstimate[i].totalPriceIncTax.toString(),
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
            DataColumn(
                label: Text(
              '',
              textAlign: TextAlign.center,
            )),
            DataColumn(
                label: Text('Module',
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
          ], rows: rowDevis()),
        ),
      ),
    );
  }
}
