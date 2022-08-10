import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/homepage.dart';


class TemsilcilerPage extends StatefulWidget {
  const TemsilcilerPage({Key key}) : super(key: key);

  @override
  State<TemsilcilerPage> createState() => _TemsilcilerPageState();
}

class _TemsilcilerPageState extends State<TemsilcilerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Şehit Furkan Doğan Yurdu"),
          automaticallyImplyLeading: false,
          leading: new IconButton(
            onPressed: () => Navigator.pushReplacement(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(top: 40),
            ),
            Temsilciler("Muhammet","Emin","2")
          ]),
        ));
  }
}

Widget Temsilciler(String title,String title2, String title3) {
  return Container(
    width: 330,
    height: 90,
    decoration: BoxDecoration(
        color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(69)),
    child: Row(children: [
      Container(
        width: 200,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(69),
              bottomLeft: Radius.circular(69),
              bottomRight: Radius.circular(0)),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 130,
            height: 30,
            child: Text("Adı : " + title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 130,
            height: 30,
            child: Text("Soyad : " + title2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: 130,
            height: 30,
            child: Text("Katı : " + title3,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),

        ]),
      ),
      Container(
        width: 130,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(69),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(69)),
        ),
        child: Icon(
            Icons.person,
            size: 55,
          ),
      ),
    ]),
  );
}
