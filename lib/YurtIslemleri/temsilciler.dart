import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/temsilciContainerClass.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';

import 'package:flutter_application_3/homepage.dart';

class TemsilcilerPage extends StatefulWidget {
  const TemsilcilerPage({Key key}) : super(key: key);

  @override
  State<TemsilcilerPage> createState() => _TemsilcilerPageState();
}

class _TemsilcilerPageState extends State<TemsilcilerPage> {
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
            page: YurtIslemleriPage(),
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
                  child: Temsilciler("Muhammet Emin", "YAĞMUR", "2", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Temsilciler("Ömer Faruk", "Işık", "3", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child:
                      Temsilciler("Ebu Bekir Talha", "İşçimen", "6", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Temsilciler("Ahmet Hasana", "Çelik", "2", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Temsilciler("Muhammet Emin", "YAĞMUR", "2", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Temsilciler("Ömer Faruk", "Işık", "3", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child:
                      Temsilciler("Ebu Bekir Talha", "İşçimen", "6", context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Temsilciler("Ahmet Hasana", "Çelik", "2", context),
                ),
              ],
            ))
          ]),
        ));
  }
}

