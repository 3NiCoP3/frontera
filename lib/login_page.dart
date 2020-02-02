import 'package:flutter/material.dart';
import 'package:frontera/services/api/EstimateService.dart';
import 'package:frontera/services/api/userService.dart';
import 'homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/8f91b942c680648023d75b40093fd8d5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(66.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              "Bienvenue sur l'application",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          SizedBox(
              height: 155.0,
              child:
                  Image.asset("assets/madera_logo.png", fit: BoxFit.contain)),
          new Container(
            child: new TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: _emailFilter,
              style: TextStyle(color: Colors.white),
              decoration: new InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(62.00)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(62.00)),
              ),
            ),
          ),
          SizedBox(height: 10),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              decoration: new InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(62.00)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(62.00)),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Erreur login"),
          content: new Text("Le duo Email/Password ne correspond pas."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fermer"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future login() async {
    try {
      if (await UserService.login(_email, _password)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        _showDialog();
      }
    } catch (InvalidCredentialsException) {
      _showDialog();
    }
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: new Text('Se connecter',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              login();
            },
          ),
          new FlatButton(
            child: new Text(
              'Mot de passe oublié ?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: _passwordReset,
          )
        ],
      ),
    );
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password
  void _passwordReset() async {
    var estimates = await EstimateService.getEstimates();
    for (var i = 0; i < estimates.length; i++) {
      for (var a = 0; a < estimates[i].modules.length; a++) {
      }
    }
    print("The user wants a password reset request sent to $_email");
  }
}
