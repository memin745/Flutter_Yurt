import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/odalar.dart';
Widget Katlar(String title, context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: Color(0xFFeeeee0), borderRadius: BorderRadius.circular(15)),
        width: 336,
        height: 71,
        child: TextButton(
          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OdalarPage()),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    ],
  );
}
