import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/katlar.dart';
import 'package:flutter_application_3/YurtIslemleri/temsilciler.dart';
import 'package:flutter_application_3/YurtIslemleri/yurtariza.dart';
import 'package:flutter_application_3/homepage.dart';


class YurtIslemleriPage extends StatefulWidget {
  const YurtIslemleriPage({ Key key }) : super(key: key);

  @override
  State<YurtIslemleriPage> createState() => _YurtIslemleriPageState();
}

class _YurtIslemleriPageState extends State<YurtIslemleriPage> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text("Yurt İşlemleri",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(
              
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
              width: size.width * 0.81,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KatlarPage()),),
              child: Text("Kat Planları",style:TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
              width: size.width * 0.81,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TemsilcilerPage()),),
              child: Text("Temsilciler",style:TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
              width: size.width * 0.81,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => YurtArizaPage()),),
              child: Text("Yurt Arıza Bildirimi",style:TextStyle(fontSize: 20),),
              ),
            ),
          ]
        ),
        
      ),
    );
  }
}