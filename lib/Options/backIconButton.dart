import 'package:flutter/material.dart';

class backIconButton extends StatelessWidget {
  const backIconButton({
    Key key,
    @required this.page,
  }) : super(key: key);

  final page;
  @override
  Widget build(BuildContext context) {
    return new IconButton(
      onPressed: () => Navigator.pushReplacement(
        //Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      icon: new Icon(Icons.arrow_back, color: Colors.white),
    );
  }
}