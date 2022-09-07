import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/duyuruClass.dart';
import 'package:flutter_application_3/Options/homePageButton.dart';
import 'package:flutter_application_3/Options/slider.dart';
import 'package:flutter_application_3/Options/status_service.dart';
import 'package:flutter_application_3/kantin/kantin.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    String name = "Name Loading...";
    String email = "Email Loading...";
    String Telefon = "Telefon Loading...";
    String bolum = "Bölüm Loading...";
    String universite = "Universite Loading...";
    String oda = "Email Loading...";
    String sehir = "Şehir Loading...";
    String sinif = "Sınıf Loading...";
    String Tc = "Tc Loading...";
    void getData() async {
      User user = await FirebaseAuth.instance.currentUser;
      var vari = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((vari) => setState(() {
                name = vari.data()['İsim Soyisim'];
                email = vari.data()['Email'];
                Telefon = vari.data()['Telefon'];
                Tc = vari.data()['T.C'];
                universite = vari.data()['Üniversite'];
                oda = vari.data()['Oda'];
                sehir = vari.data()['Şehir'];
                sinif = vari.data()['Sınıf'];
                bolum = vari.data()['Bölüm'];
              }));
    }

    @override
    void initState() {
      getData();
      
      super.initState();
    }

    background _background = background();
    duyuru _duyuru = duyuru();
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    
  print(
        name + Telefon + email + Tc + universite + oda + sehir + sinif + bolum);
    StatusService _statusService = StatusService();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        centerTitle: true,
        leading: Container(
            width: 200,
            height: 50, 
            child: Image(
              image: AssetImage("assets/iycc.png"),
            )),
        leadingWidth: 200,
        title: baslikTitle(),
      ),
      body: Shimmer(
        duration: Duration(seconds: 10),
        interval: Duration(seconds: 5),
        color: Color(0xFFCEEEFF),
        colorOpacity: 0.3,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          padding: EdgeInsets.only(top: size.width * 0.02),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _background.image,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/tablet.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: SizedBox(
                height: 200.0,
                width: double.infinity,
                child: slider(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300].withOpacity(0.01),
              ),
              width: size.width * 0.90,
              height: size.height * 0.30,
              child: Column(
                children: [
                  baslikContainer(title: "Duyurular", size: 22),
                  Expanded(
                      child: duyuru(
                    size: size / 2.1,
                    statusService: _statusService,
                  )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.01),
              ),
              width: size.width * 0.85,
              height: size.height * 0.15,
              child: Row(
                children: [
                  homePageButton(
                    size: size,
                    title: "Kantin",
                    page: KantinPage(),
                  ),
                  homePageButton(
                    size: size,
                    page: YemekhanePage(),
                    title: "Yemekhane",
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
