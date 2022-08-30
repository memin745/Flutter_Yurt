import 'package:flutter/material.dart';

class appbarContainer extends StatelessWidget {
  const appbarContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Colors.black26,
            Colors.blueGrey,
          ],
        ),
      ),
    );
  }
}