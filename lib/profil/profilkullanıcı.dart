// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/get_user_name.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class ProfilKullaniciPage extends StatefulWidget {
  const ProfilKullaniciPage({Key key}) : super(key: key);

  @override
  State<ProfilKullaniciPage> createState() => _ProfilKullaniciPageState();
}

class _ProfilKullaniciPageState extends State<ProfilKullaniciPage> {
  List<String> docIds = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
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
            Expanded(child: FutureBuilder(
              future: getDocIds(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount:2,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        title: GetUserName(documentId: docIds[index],),
                        
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

Widget KullaniciProfil(String title, context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFeeeee0),
    ),
    width: size.width * 0.50,
    height: size.height * 0.08,
    padding: EdgeInsets.only(top: 25),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
  );
}
