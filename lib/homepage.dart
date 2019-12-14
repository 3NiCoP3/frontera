import 'package:flutter/material.dart';
import 'components/roundedButton.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

Widget searchBar = TextField(
  textAlign: TextAlign.center,
  style: TextStyle(color: Colors.white),
  decoration: new InputDecoration(
    labelText: 'Ecrivez ici pour rechercher...',
    labelStyle: TextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 3.0),
        borderRadius: BorderRadius.circular(62.00)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(62.00)),
  ),
);

Widget upSection = new Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    RoundedButton('Création \nde Devis','assets/devis.png'),
    VerticalDivider(color: Colors.transparent, width: 40.0),
    RoundedButton('Modification \nde Devis','assets/gomme.png'),
  ],
);


Widget downSection = new Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    RoundedButton('Simulateur\n 3D', 'assets/simu_3D.png'),
    VerticalDivider(color: Colors.transparent, width: 40.0),
    RoundedButton('Base Clients', 'assets/base_client.png'),
  ],
);

class HomePageState extends State<HomePage> {
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    upSection,
                    SizedBox(height: 50.0),
                    downSection
                  ],
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 70.0,
                      child: Image.asset("assets/madera_logo.png",
                          fit: BoxFit.contain)),
                  SizedBox(height: 10.0),
                  searchBar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
