

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
        backgroundColor: Color(0xFF808080),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/i4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(children: [
          SutunOlustur("Kat",context,"Katı Yazın..."),
          SutunOlustur("Sorun",context,"Sorunu Yazın..."),
          
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
Widget SutunOlustur(String title,context,String hinttext){
  Size size = MediaQuery.of(context).size;

  return Container(
             margin: EdgeInsets.only(top: 15),
             width: 320,
        height: 50,
        child: Row(children: [
          Container(
             width: size.width*0.30,
        height: 50,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
        padding: EdgeInsets.only(top: 15),
        child: Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Container(
                margin: EdgeInsets.only(left: size.width * 0.10),
                decoration: BoxDecoration(
                    color: Color(0xFFeeeee0,),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.40,
                height: size.height * 0.05,
                padding: EdgeInsets.only(left: size.width * 0.03),
                child:TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hinttext,
                    ),
                  ),
              ),
          
        ]),
          );
}
