import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/buttons.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/basvurular.dart';
import 'package:flutter_application_3/izinbasvuru/basvurularim.dart';
import 'package:flutter_application_3/izinbasvuru/izinalma.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class IzinveBasvuruPage extends StatefulWidget {
  const IzinveBasvuruPage({Key key}) : super(key: key);

  @override
  State<IzinveBasvuruPage> createState() => _IzinveBasvuruPageState();
}

class _IzinveBasvuruPageState extends State<IzinveBasvuruPage> {
  @override
  Widget build(BuildContext context) {
    background _background = background();
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
         flexibleSpace: appbarContainer(),
        title: baslikTitle(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttons(size: size/1.1, page: BavurularPage(), title: "Etkinlikler"),
            buttons(size: size/1.1, page: IzinAlmaPage(), title: "İzin İşlemleri")
          ],
        ),
      ),
    );
  }
}
