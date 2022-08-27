// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class ProfilKullaniciPage extends StatefulWidget {
  const ProfilKullaniciPage({Key key}) : super(key: key);

  @override
  State<ProfilKullaniciPage> createState() => _ProfilKullaniciPageState();
}

class _ProfilKullaniciPageState extends State<ProfilKullaniciPage> {
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

  String myEmail;
  List<String> docIds = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.white,
              Color(0xFF808080),
              Colors.blueGrey,

            ],
          ),
        ),
      ),
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilGirisPage()),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/i4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.person,
                size: 50,
                color: Color(0xFFeeeee0),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [

                   Container(
                      child: KullaniciProfil( name, context),
                    ),
                  
                  Container(
                    child: KullaniciProfil( Telefon, context),
                  ),
                  Container(
                    child: KullaniciProfil( sehir, context),
                  ),
                  Container(
                    child: KullaniciProfil(email, context),
                  ),
                  Container(
                    child:
                        KullaniciProfil(universite, context),
                  ),
                  Container(
                    child: KullaniciProfil(bolum, context),
                  ),
                  Container(
                    child:
                        KullaniciProfil(sinif+'. Sınıf', context),
                  ),
                  Container(
                    child: KullaniciProfil(oda, context),
                  ),
                  
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fetch() async {
    final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;
    final _firebaseUser = await FirebaseAuth.instance.currentUser.uid;

    if (_firebaseUser != null)
      // ignore: curly_braces_in_flow_control_structures
      await _firestoreDb
          .collection('users')
          .doc(_firebaseUser)
          .get()
          .then((ds) {
        String myEmail = ds.data()["adi"];
        print(myEmail);
      });
  }
}

Widget KullaniciProfil(String title, context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: size.height * 0.03),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFeeeee0),
    ),
    width: size.width * 1,
    height: size.height * 0.1,
    padding: EdgeInsets.only(top: size.height * 0.030),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22, color: Colors.black),
    ),
  );
}
