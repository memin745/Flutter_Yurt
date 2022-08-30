import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/kantin/kantin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class BakiyeYuklePage extends StatefulWidget {
  const BakiyeYuklePage({Key key}) : super(key: key);

  @override
  State<BakiyeYuklePage> createState() => _BakiyeYuklePageState();
}

class _BakiyeYuklePageState extends State<BakiyeYuklePage> {
  @override
  Widget build(BuildContext context) {
    background _background = background();
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
         flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.black26,
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
            MaterialPageRoute(builder: (context) => KantinPage()),
          ),
        ),
      ),
      body: ProfilTasarimiPage(),
    );
  }
}

class ProfilTasarimiPage extends StatefulWidget {
  const ProfilTasarimiPage({Key key}) : super(key: key);

  @override
  State<ProfilTasarimiPage> createState() => _ProfilTasarimiPageState();
}

class _ProfilTasarimiPageState extends State<ProfilTasarimiPage> {
  File yuklenecekDosya;
  FirebaseAuth auth = FirebaseAuth.instance;
  String indermeBaglantisi;

  kameradanYukle() async {
    var alinanDosya = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      yuklenecekDosya = File(alinanDosya.path);
    });
    Reference referansYol = FirebaseStorage.instance
        .ref()
        .child("profilresimleri")
        .child("profilResmi.png");
        // ignore: unused_local_variable
        UploadTask yuklemeGorevi = referansYol.putFile(yuklenecekDosya);
        String url = await(await yuklemeGorevi).ref.getDownloadURL();
        setState(() {
          indermeBaglantisi = url;
        });
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: () => kameradanYukle(),child: Text("YÜKLE"),),
      
    );
  }
}
