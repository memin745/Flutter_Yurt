// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/LoginPage.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/buttons.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/profil/izinislemleri.dart';
import 'package:flutter_application_3/profil/profilkullan%C4%B1c%C4%B1.dart';
import 'package:flutter_application_3/profil/yurtfaaliyetleri.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilGirisPage extends StatefulWidget {
  const ProfilGirisPage({Key key}) : super(key: key);

  @override
  State<ProfilGirisPage> createState() => _ProfilGirisPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> _signOut() async {
  await _auth.signOut();
  await FirebaseAuth.instance.signOut();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    ),
  );
}

class _ProfilGirisPageState extends State<ProfilGirisPage> {
  void launchWhatsapp(number, message) async {
    String url = "whatsapp://send?phone=$number&text=$message";

    await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
  }

  final String _url = 'https://youtube.com';
  final String _phoneNumber = "+905331608752";
  final String _email = "mailto:omerfarukiskk@gmail.com";
  bool loggedIn = FirebaseAuth.instance.currentUser == IdTokenResult;
  @override
  Widget build(BuildContext context) {
    background _background = background();
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: appbarContainer(),
          title: Text("Şehit Furkan Doğan Yurdu"),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFeeeee0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.50),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFeeeee0),
                        ),
                        width: size.width * 0.50,
                        height: size.height * 0.08,
                        child: TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                  //Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfilKullaniciPage()),
                                ),
                            child: Text("Kullanıcı Bilgileri",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)))),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: size.width * 0.20,
                      height: size.height * 0.08,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                width: size.width * 0.70,
                height: size.height * 0.08,
              ),
              buttons(
                size: size,
                page: YurtFaaliyetleriPage(),
                title: "Yurt Faaliyetleri",
              ),
              buttons(
                  size: size, page: IzinIslemleriPage(), title: "İzin Geçmişi"),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFeeeee0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(1),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  width: size.width * 0.70,
                  height: size.height * 0.08,
                  child: TextButton(
                      onPressed: () => _signOut(),
                      child: Text("Çıkış",
                          style:
                              TextStyle(fontSize: 20, color: Colors.black)))),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                padding: EdgeInsets.only(left: size.height * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: MaterialButton(
                        onPressed: () async {
                          final _call = 'tel:$_phoneNumber';
                          final _text = 'sms:$_phoneNumber';
                          final email = _email;
                          if (await canLaunch(email)) {
                            // ignore: deprecated_member_use
                            await launch(email);
                          }
                        },
                        child: Icon(
                          Icons.mail,
                          size: 50,
                          color: Colors.white,
                        )),
                  ),
                  MaterialButton(
                      onPressed: () async {
                        final _call = 'tel:$_phoneNumber';
                        final _text = 'sms:$_phoneNumber';
                        final email = _email;
                        if (await canLaunch(_call)) {
                          // ignore: deprecated_member_use
                          await launch(_call);
                        }
                      },
                      child: Icon(
                        Icons.call,
                        size: 50,
                        color: Colors.white,
                      )),
                  MaterialButton(
                      onPressed: () {
                        launchWhatsapp("+905331608752", "Selam");
                      },
                      child: Icon(
                        Icons.whatsapp,
                        size: 50,
                        color: Colors.white,
                      )),
                ]),
              ),
            ])));
  }
}


