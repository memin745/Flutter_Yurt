import 'package:flutter/material.dart';

Widget Temsilciler(String title, String title2, String title3, context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.80,
    height: size.height * 0.12,
    decoration: BoxDecoration(
        color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(15)),
    child: Row(children: [
      Container(
        width: size.width * 0.70,
        height: size.height * 0.12,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(0)),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            width: size.width * 0.60,
            height: size.height * 0.04,
            child: Text(
              "Adı : " + title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: size.width * 0.60,
            height: size.height * 0.04,
            child: Text(
              "Soyad : " + title2,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: size.width * 0.60,
            height: size.height * 0.04,
            child: Text(
              "Katı : " + title3,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
      Container(
        width: size.width * 0.259,
        height: size.height * 0.12,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(15)),
        ),
        child: Icon(
          Icons.person,
          size: 55,
        ),
      ),
    ]),
  );
}
