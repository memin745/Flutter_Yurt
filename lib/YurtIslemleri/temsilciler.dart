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
            onPressed: () => Navigator.pushReplacement(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(top: 40),
            ),
            Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Muhammet Emin","YAĞMUR","2",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Ömer Faruk","Işık","3",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Ebu Bekir Talha","İşçimen","6",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Ahmet Hasana","Çelik","2",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Muhammet Emin","YAĞMUR","2",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Ömer Faruk","Işık","3",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Ebu Bekir Talha","İşçimen","6",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Temsilciler("Ahmet Hasana","Çelik","2",context),
                ),
              ],
            )
          )
          ]),
        ));
  }
}

Widget Temsilciler(String title,String title2, String title3,context) {
     Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width*0.80,
    height:size.height * 0.12,
    decoration: BoxDecoration(
        color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(15)),
    child: Row(children: [
      Container(
        width:size.width * 0.70,
        height: size.height *0.12,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(0)),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            width:size.width * 0.60,
            height: size.height *0.04,
            child: Text("Adı : " + title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
           width:size.width * 0.60,
            height: size.height *0.04,
            child: Text("Soyad : " + title2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
           width:size.width * 0.60,
            height: size.height *0.04,
            child: Text("Katı : " + title3,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),

        ]),
      ),
      Container(
        width:size.width * 0.259,
        height: size.height *0.12,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(15)),
        ),
        child: Icon(
            Icons.person,
            size: 55,
          ),
      ),
    ]),
  );
}
