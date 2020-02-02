import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/components/customerAutoComplete.dart';
import 'package:frontera/homepage.dart';
import 'package:frontera/services/api/EstimateService.dart';
import 'package:frontera/services/api/moduleService.dart';
import 'classes/module.dart';
import 'components/ModuleDataTable.dart';
import 'components/moduleCountSelector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: DevisPage(),
    );
  }
}

class DevisPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DevisPageState();
}

class DevisPageState extends State<DevisPage> {
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

  addModule() {
    setState(() {
      currentModule.count++;
    });
  }

  removeModule() {
    if (currentModule.count > 1) {
      setState(() {
        currentModule.count--;
      });
    }
  }

  validateModule() {
    setState(() {
      if (currentModule != null) {
        selectedModules.add(currentModule);
        currentModule = null;
      }
    });
  }

  annulation() {
    setState(() {
      currentModule = null;
    });
  }

  cancelModule() {
    setState(() {
      currentModule = null;
    });
  }

  deleteModule(Module module) {
    setState(() {
      selectedModules.remove(module);
    });
  }

  @override
  void initState() {
    getModules();
    super.initState();
  }

  void _showDialogAcceptation() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.black26,
          title: new Text(
            "Valider le devis",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: new Text(
            "Le devis va être sauvegardé et envoyé en base de données, vous pourez le modifier ultérieurement",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              color: Colors.lightGreen,
              textColor: Colors.white,
              highlightColor: Colors.greenAccent,
              colorBrightness: Brightness.dark,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: new Text(
                "Valider",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                EstimateService.saveEstimate(selectedModules);
                Navigator.of(context).pop();
                _showDialogSend();
              },
            ),
            new FlatButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              highlightColor: Colors.deepOrangeAccent,
              colorBrightness: Brightness.dark,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: new Text(
                "Fermer",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogSend() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.black26,
          title: new Text(
            "Devis envoyé",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: new Text(
            "Le devis de a bien été pris en compte et sauvegardé.",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              highlightColor: Colors.deepOrangeAccent,
              colorBrightness: Brightness.dark,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: new Text(
                "Fermer",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/floor-parquet-pattern-172292.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: new Icon(Icons.arrow_back,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                      Expanded(
                        child: SizedBox(
                            height: 70.0,
                            child: Image.asset("assets/madera_logo.png",
                                fit: BoxFit.contain)),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.00),
                  CustomersAutoComplete(),
                  SizedBox(height: 40.00),
                  Container(
                    child: Column(
                      children: <Widget>[
                        loading
                            ? CircularProgressIndicator()
                            : searchTextField = AutoCompleteTextField<Module>(
                                key: searchModuleKey,
                                clearOnSubmit: true,
                                suggestions: modulesList,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black38,
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.white),
                                  labelText: 'Rechercher un module ...',
                                  labelStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 3.0),
                                      borderRadius:
                                          BorderRadius.circular(62.00)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(62.00)),
                                ),
                                itemFilter: (item, query) {
                                  return item.name
                                      .toLowerCase()
                                      .contains(query.toLowerCase());
                                },
                                itemSorter: (a, b) {
                                  return a.name.compareTo(b.name);
                                },
                                itemSubmitted: (item) {
                                  setState(() {
                                    currentModule = item;
                                    searchTextField.textField.controller.text =
                                        item.name +
                                            " : (" +
                                            item.reference +
                                            ")";
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
                        ModuleCountSelector(
                            currentModule,
                            addModule, //addModule
                            removeModule, //removeModule
                            validateModule,
                            annulation //validateModule
                            ),
                        SizedBox(height: 10.00),
                        ModuleDataTable(selectedModules, deleteModule),
                        SizedBox(height: 10.00),
                        new FlatButton(
                          color: Colors.lightGreen,
                          textColor: Colors.white,
                          highlightColor: Colors.greenAccent,
                          colorBrightness: Brightness.dark,
                          textTheme: ButtonTextTheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
//                          shape: CircleBorder(),
                          child: new Text(
                            'Valider devis',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            _showDialogAcceptation();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
