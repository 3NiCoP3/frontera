import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/classes/module.dart';
import 'package:frontera/services/api/moduleService.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'ModuleDataTable.dart';

class ModuleComponent extends StatefulWidget {
  @override
  _ModuleComponentState createState() => _ModuleComponentState();
}

class _ModuleComponentState extends State<ModuleComponent> {
  AutoCompleteTextField searchTextField;

  List<Module> selectedModules = [];

  Module currentModule;

  GlobalKey<AutoCompleteTextFieldState<Module>> searchModuleKey =
      new GlobalKey();

  static List<Module> modulesList = new List<Module>();
  bool loading = true;

  void getModules() async {
    try {
      modulesList = await ModuleService.getModules();

      setState(() {
        loading = false;
      });
    } catch (e) {
      print("Error getting modules.");
    }
  }

  @override
  void initState() {
    getModules();
    super.initState();
  }

  Widget _buttons() {
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
                  setState(() {
                    currentModule.count++;
                  });
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
                  setState(() {
                    if (currentModule.count > 1) {
                      currentModule.count--;
                    }
                  });
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
                  setState(() {
                    if (currentModule != null) {
                      selectedModules.add(currentModule);
                      currentModule = null;
                    }
                  });
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
                  setState(() {
                    currentModule = null;
                  });
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          loading
              ? CircularProgressIndicator()
              : searchTextField = AutoCompleteTextField<Module>(
                  key: searchModuleKey,
                  clearOnSubmit: true,
                  suggestions: modulesList,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black38,
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    labelText: 'Rechercher un module ...',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3.0),
                        borderRadius: BorderRadius.circular(62.00)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(62.00)),
                  ),
                  itemFilter: (item, query) {
                    return item.name
                        .toLowerCase()
                        .startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    return a.name.compareTo(b.name);
                  },
                  itemSubmitted: (item) {
                    setState(() {
                      currentModule = item;
//                      selectedModules.add(item);
                      searchTextField.textField.controller.text =
                          item.name + " : (" + item.reference + ")";
                    });
                  },
                  itemBuilder: (context, item) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Référence : " + item.name,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
          SizedBox(height: 10.00),
          new Text(
            currentModule != null ? currentModule.name : "",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                backgroundColor: Colors.white12),
          ),
          SizedBox(height: 5.00),
          _buttons(),
          SizedBox(height: 10.00),
          ModuleDataTable(selectedModules),
        ],
      ),
    );
  }
}
