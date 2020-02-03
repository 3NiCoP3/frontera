import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/classes/module.dart';

typedef ModuleCallBack = void Function(Module module);

class ModuleDataTable extends StatelessWidget {
  List<Module> selectedModules;
  final ModuleCallBack deleteModule;

  ModuleDataTable(this.selectedModules, this.deleteModule);

  List<DataRow> rowModule() {
    List<DataRow> myList = [];
    for (var i = 0; i < selectedModules.length; i++) {
      myList.add(DataRow(cells: [
        DataCell(Icon(Icons.delete, color: Colors.white), onTap: () {
          deleteModule(selectedModules[i]);
        }),
        DataCell(Text(selectedModules[i].name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24))),
        DataCell(Text(selectedModules[i].count.toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24))),
        DataCell(Text(selectedModules[i].priceWithVat.toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24))),
        DataCell(Text('20',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24))),
        DataCell(Text(
            (selectedModules[i].priceWithVat * selectedModules[i].count)
                .toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24))),
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
          ], rows: rowModule()),
        ),
      ),
    );
  }
}
