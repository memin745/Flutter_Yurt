import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/YurtIslemleri/katlar.dart';
import 'package:flutter_application_3/homepage.dart';


class OdalarPage extends StatefulWidget {
  const OdalarPage({Key key}) : super(key: key);

  @override
  State<OdalarPage> createState() => _OdalarPageState();
}

class _OdalarPageState extends State<OdalarPage> {
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
            MaterialPageRoute(builder: (context) =>   KatlarPage()),
          ),
          icon: new Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3.jpg"),
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
                child:odalar("101 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("102 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("103 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("104 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("105 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("106 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("107 numaralı Oda"),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:odalar("108 numaralı Oda"),
                ),
              ],
            )
          )
        ]),
      ),
    );
  }
}

Widget odalar(String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    width: 340,
    height: 90,
    decoration: BoxDecoration(
        color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(69)),
    child: Column(children: [
      Container(
        width: 340,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(69),
              topLeft: Radius.circular(69),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
        ),
        padding: EdgeInsets.only(top: 12),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: 340,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(69),
              bottomRight: Radius.circular(69)),
        ),
        padding: EdgeInsets.only(left: 60,),
        child: Row(children: [
          Icon(
            Icons.person,
            size: 55,
          ),
          Icon(
            Icons.person,
            size: 55,
          ),
          Icon(
            Icons.person,
            size: 55,
          ),
          Icon(
            Icons.person,
            size: 55,
          ),
        ]),
      ),
    ]),
  );
}