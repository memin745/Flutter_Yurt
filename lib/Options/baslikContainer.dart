import 'package:flutter/material.dart';

class baslikContainer extends StatelessWidget {
  const baslikContainer({
    Key key,
    @required this.title,
    @required this.size,
  }) : super(key: key);
  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
}
class baslikTitle extends StatelessWidget {
    const baslikTitle({
      Key key,
    }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Text("Şehit Furkan Doğan Yurdu");
    }
  }
  
