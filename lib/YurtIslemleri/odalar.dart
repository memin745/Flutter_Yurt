import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/odalarContainerClass.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/YurtIslemleri/katlar.dart';

import 'package:flutter_application_3/homepage.dart';

class OdalarPage extends StatefulWidget {
  const OdalarPage({Key key}) : super(key: key);

  @override
  State<OdalarPage> createState() => _OdalarPageState();
}

class _OdalarPageState extends State<OdalarPage> {
  @override
  Widget build(BuildContext context) {
    background _background = background();
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        title: baslikTitle(),
        automaticallyImplyLeading: false,
        leading: backIconButton(
          page: KatlarPage(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _background.image,
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(top: 40),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("101 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("102 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("103 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("104 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("105 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("106 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("107 numaralı Oda"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: odalar("108 numaralı Oda"),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}

