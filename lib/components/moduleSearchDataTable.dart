import 'package:flutter/cupertino.dart';
import 'package:frontera/classes/Estimate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/classes/module.dart';
import 'package:frontera/services/api/EstimateService.dart';

typedef EstimateCallBack = void Function(Estimate estimate);
typedef ModuleCallBack = void Function(Module estimate);

class ModuleSearchDataTable extends StatelessWidget {
  Estimate selectedEstimate;
  final EstimateCallBack deleteEstimate;
  final ModuleCallBack deleteModule;

  ModuleSearchDataTable(
      this.selectedEstimate, this.deleteEstimate, this.deleteModule);

  _modules(String reference) async {
    var estimates = await EstimateService.getEstimates();
    for (var i = 0; i < estimates.length; i++) {
      if (reference == estimates[i].reference) {
        return estimates[i].modules;
      }
    }
  }

  List<DataRow> rowDevis() {
    List<DataRow> myList = [];
    //return immediatly if devis list is empty
    if (selectedEstimate == null) {
      return myList;
    }
    for (var i = 0; i < selectedEstimate.modules.length; i++) {
      myList.add(DataRow(cells: [
        DataCell(Icon(Icons.delete, color: Colors.white), onTap: () {
          deleteModule(selectedEstimate.modules[i]);
        }),
        DataCell(Text(selectedEstimate.modules[i].name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
        DataCell(Text(
            selectedEstimate.modules[i].priceWithVat.toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16))),
        DataCell(Text(
            (selectedEstimate.modules[i].priceWithVat * 0.80)
                .toStringAsFixed(2),
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
