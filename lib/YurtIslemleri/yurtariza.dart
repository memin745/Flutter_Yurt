

import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/homepage.dart';


class YurtArizaPage extends StatefulWidget {
  const YurtArizaPage({ Key key }) : super(key: key);

  @override
  State<YurtArizaPage> createState() => _YurtArizaPageState();
}

class _YurtArizaPageState extends State<YurtArizaPage> {
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => YurtIslemleriPage()),
        ),
          icon: new Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.width * 0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        width: size.width * 0.85,
        height: size.height * 0.80,
        child: Column(children: [
          SutunOlustur("Kat"),
          SutunOlustur("Sorun"),
          
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(top: 15),
            width: size.width * 0.25,
            height: size.height *0.07,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
            child: Text("Gönder",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ],),
      ),
    );
  }
}
Widget SutunOlustur(String title){

  return Container(
             margin: EdgeInsets.only(top: 15),
             width: 320,
        height: 50,
        child: Row(children: [
          Container(
             width: 100,
        height: 50,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
        padding: EdgeInsets.only(top: 15),
        child: Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
             width:200,
        height: 50,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
          ),
          
        ]),
          );
}
