import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/components/inputGeo.dart';
import 'package:frontera/components/inputNbr.dart';
import 'package:frontera/components/inputNameCustomer.dart';
import 'package:frontera/components/inputFirstNameCustomer.dart';
import 'package:frontera/components/inputCompanyCustomer.dart';
import 'package:frontera/components/inputModule.dart';
import 'package:frontera/components/inputDimension.dart';
import 'package:frontera/components/inputGamme.dart';
import 'package:frontera/components/testTable.dart';
import 'package:frontera/components/testDataTable.dart';

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
  final TextEditingController searchFilter = new TextEditingController();

  String search = "";

  DevisPageState() {
    searchFilter.addListener(searchListen);
  }

  void searchListen() {
    if (searchFilter.text.isEmpty) {
      search = "";
    } else {
      search = searchFilter.text;
    }
  }

  Widget searchBar() {
    return new Container(
      child: new TextField(
        textAlign: TextAlign.center,
        controller: searchFilter,
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          filled: true,
          fillColor: Colors.black38,
          prefixIcon: Icon(Icons.search, color: Colors.white),
          labelText: 'Recherchez un composant ...',
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3.0),
              borderRadius: BorderRadius.circular(62.00)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(62.00)),
        ),
      ),
    );
  }

  Widget identity = new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      InputNameCustomer('Nom', 190),
      VerticalDivider(color: Colors.transparent, width: 10.0),
      InputFirstNameCustomer('Prénom', 190),
      VerticalDivider(color: Colors.transparent, width: 10.0),
      InputCompanyCustomer('Société', 190),
    ],
  );

  Widget modules = new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      InputModule('Module', 285),
      VerticalDivider(color: Colors.transparent, width: 10.0),
      InputDimension('Dimension L x l x h', 285),
    ],
  );

  Widget lastline = new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      InputGamme('Choix de la gamme', 285),
      VerticalDivider(color: Colors.transparent, width: 10.0),
      InputGeo('Position Géographique', 285),
    ],
  );

  Widget nombre = new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      InputNbr('Nbr', 100),
    ],
  );

  Widget identityCustomer = new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text("Nom : ", style: TextStyle(color: Colors.white)),
      VerticalDivider(color: Colors.transparent, width: 10.0),
      Text("Prénom : ", style: TextStyle(color: Colors.white)),
      VerticalDivider(color: Colors.transparent, width: 10.0),
      Text("Société : ", style: TextStyle(color: Colors.white)),
    ],
  );

  Widget validComposant() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: new Text('Valider Composant',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget validCustomer() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: new Text('Valider Client',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {},
          ),
        ],
      ),
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
                  SizedBox(
                      height: 70.0,
                      child: Image.asset("assets/madera_logo.png",
                          fit: BoxFit.contain)),
                  SizedBox(height: 5.0),
                  identity,
                  SizedBox(height: 5.0),
                  validCustomer(),
                  SizedBox(height: 5.0),
                  searchBar(),
                  SizedBox(height: 5.0),
                  modules,
                  SizedBox(height: 5.0),
                  lastline,
                  SizedBox(height: 5.0),
                  nombre,
                  SizedBox(height: 5.0),
                  validComposant(),
                  SizedBox(height: 10.0),
                  identityCustomer,
                  SizedBox(height: 10.0),
                  TestDataTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
