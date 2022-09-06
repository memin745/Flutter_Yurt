import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class YurtArizaPage extends StatefulWidget {
  const YurtArizaPage({Key key}) : super(key: key);

  @override
  State<YurtArizaPage> createState() => _YurtArizaPageState();
}

class _YurtArizaPageState extends State<YurtArizaPage> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController katController = TextEditingController();
  TextEditingController sorunController = TextEditingController();
  String email;
  @override
  Widget build(BuildContext context) {
    background _background = background();
    CollectionReference arizaRef = _firestore.collection('Ariza');
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
            padding: EdgeInsets.only(top: size.width * 0.02),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _background.image,
                fit: BoxFit.cover,
              ),
            ),
            width: size.width * 1,
            height: size.height * 1,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    controller: katController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Kat Giriniz',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.25,
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: sorunController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Sorun Giriniz',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 47, 194, 62),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.50),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        )
                      ]),
                  width: size.width * 0.40,
                  height: size.height * 0.08,
                  child: TextButton(
                    onPressed: () async {
                      print(katController.text);
                      print(sorunController.text);

                      Map<String, String> movieData = {
                        'name': katController.text,
                        'duyuru': sorunController.text,
                      };
                      String kat = katController.text;
                      String sorun = sorunController.text;

                      await arizaRef.doc().set({
                        'Email': FirebaseAuth.instance.currentUser.email,
                        'Kat': '$kat',
                        'Sorun': '$sorun',
                        'Tarih': DateTime.now(),
                        'Ariza Durumu': false
                      }, katController.text = null);
                      Fluttertoast.showToast(
                          msg: "Arıza Gönderildi",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.amber,
                          textColor: Colors.white,
                          fontSize: 15);
                      Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YurtArizaPage()));
                    },
                    child: Text(
                      "Bildir",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )));
  }
}
