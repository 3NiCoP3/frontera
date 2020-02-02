import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/moduleSearchAutoComplete.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: EditDevisPage(),
    );
  }
}

class EditDevisPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EditDevisPageState();
}

class EditDevisPageState extends State<EditDevisPage> {
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
                  SizedBox(height:40.00),
                  DevisSearchAutoComplete(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
