import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String text;
  String img;
  Widget link;

  RoundedButton(this.text, this.img, this.link);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          child: Material(
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.white12,
            child: Ink.image(
              image: AssetImage(img),
              width: 170.0,
              height: 170.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => link),
                  );
                },
              ),
            ),
          ),
        ),
        new Text(
          text,
          style: TextStyle(fontSize: 25.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
