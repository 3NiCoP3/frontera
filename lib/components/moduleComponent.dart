import 'package:flutter/material.dart';
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

  Widget row(Module module) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Nom : " + module.name,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 3.0,
        ),
        Text(
          "Prénom : " + module.name,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Email : " + module.name,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
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
          new Text(currentModule!= null ? currentModule.name : ""),
          new Row(
            children: <Widget>[
              new FlatButton(
                child: new Text(
                  ' - ',
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  setState((){
                    if (currentModule.count > 1){
                      currentModule.count ++;
                    }
                  });

                },
              ),
              new Text(currentModule != null ? currentModule.count.toString() : "0"),
              new FlatButton(
                child: new Text(
                  ' + ',
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  setState((){
                      currentModule.count ++;
                  });
                },
              ),
              new FlatButton(
                child: new Text("Ajouter"),
                onPressed: (){
                  setState((){
                    if (currentModule != null){
                      selectedModules.add(currentModule);
                      print('YANDALE !!');
                      print(selectedModules.length.toString());
                      currentModule = null;
                    }

                  });
                },
              ),
              new FlatButton(
                child: new Text("Annuler"),
                onPressed: (){
                  setState((){
                    currentModule = null;
                  });
                },
              )
            ],
          ),

          ModuleDataTable(selectedModules),
        ],
      ),
    );
  }
}
