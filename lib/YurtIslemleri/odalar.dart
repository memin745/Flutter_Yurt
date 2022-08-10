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
          odalar("101 Numaralı Oda"),
          odalar("102 Numaralı Oda"),
          odalar("103 Numaralı Oda"),
          odalar("104 Numaralı Oda"),
          odalar("105 Numaralı Oda")
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
