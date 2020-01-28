import 'package:flutter/material.dart';
import 'package:frontera/classes/module.dart';

class ModuleCountSelector extends StatelessWidget{
  Module currentModule;
  VoidCallback addModule;
  VoidCallback removeModule;
  VoidCallback validate;

  ModuleCountSelector(this.currentModule, this.addModule, this.removeModule, this.validate);

  @override
  Widget build(BuildContext context) {
    if (currentModule != null) {
      return Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new FlatButton(
                color: Colors.lightGreen,
                textColor: Colors.white,
                highlightColor: Colors.greenAccent,
                colorBrightness: Brightness.dark,
                textTheme: ButtonTextTheme.primary,
                shape: CircleBorder(),
                child: new Text(
                  ' + ',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  addModule();
                },
              ),
              new Text(
                currentModule != null ? currentModule.count.toString() : "0",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              new FlatButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                highlightColor: Colors.deepOrangeAccent,
                colorBrightness: Brightness.dark,
                textTheme: ButtonTextTheme.primary,
                shape: CircleBorder(),
                child: new Text(
                  ' - ',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {

                    if (currentModule.count > 1) {
                      removeModule();
                    }

                },
              ),
            ],
          ),
          SizedBox(height: 10.00),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new FlatButton(
                color: Colors.lightGreen,
                textColor: Colors.white,
                highlightColor: Colors.greenAccent,
                colorBrightness: Brightness.dark,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: new Text("Ajouter"),
                onPressed: () {
//                  setState(() {
//                    if (currentModule != null) {
//                      selectedModules.add(currentModule);
//                      currentModule = null;
//                    }
//                  });
                validate();
                },
              ),
              VerticalDivider(color: Colors.transparent, width: 40.0),
              new FlatButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                highlightColor: Colors.deepOrangeAccent,
                colorBrightness: Brightness.dark,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: new Text("Annuler"),
                onPressed: () {
//                  setState(() {
//                    currentModule = null;
//                  });
                },
              )
            ],
          ),
        ],
      );
    } else {
      return Text("");
    }
  }
}