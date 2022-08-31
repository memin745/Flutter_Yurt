import 'package:flutter/material.dart';

Widget odalar(String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    width: 340,
    height: 90,
    decoration: BoxDecoration(
        color: Color(0xFFeeeee0), borderRadius: BorderRadius.circular(15)),
    child: Column(children: [
      Container(
        width: 340,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(69),
              topLeft: Radius.circular(69),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
        ),
        padding: EdgeInsets.only(top: 12),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: 340,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(69),
              bottomRight: Radius.circular(69)),
        ),
        padding: EdgeInsets.only(
          left: 60,
        ),
        child: Row(children: [
          Icon(
            Icons.person,
            size: 55,
          ),
          Icon(
            Icons.person,
            size: 55,
          ),
          Icon(
            Icons.person,
            size: 55,
          ),
          Icon(
            Icons.person,
            size: 55,
          ),
        ]),
      ),
    ]),
  );
}
