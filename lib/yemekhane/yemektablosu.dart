import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';

class YemekTablosuPage extends StatefulWidget {
  const YemekTablosuPage({Key key}) : super(key: key);

  @override
  State<YemekTablosuPage> createState() => _YemekTablosuPageState();
}

class _YemekTablosuPageState extends State<YemekTablosuPage> {
  @override
  Widget build(BuildContext context) {
    background _background = background();
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        title: baslikTitle(),
        automaticallyImplyLeading: false,
        leading: backIconButton(
          page: YemekhanePage(),
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
      ),
    );
  }
}
