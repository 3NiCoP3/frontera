import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:frontera/components/customerAutoComplete.dart';
import 'classes/module.dart';
import 'components/moduleComponent.dart';

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
  void addModuleListener(Module selectedModule) {
    print("===============================");
    print(selectedModule);
    print(selectedModule.name);
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
                  SizedBox(height: 10.00),
                  CustomersAutoComplete(),
                  SizedBox(height: 10.00),
                  ModuleComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
