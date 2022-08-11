import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/yemekhane/yemektablosu.dart';

class YemekhanePage extends StatefulWidget {
  const YemekhanePage({Key key}) : super(key: key);

  @override
  State<YemekhanePage> createState() => _YemekhanePageState();
}

class _YemekhanePageState extends State<YemekhanePage> {
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
            MaterialPageRoute(builder: (context) => HomePage()),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: size.width * 0.70,
              height: size.height * 0.20,
              child: Column(
                                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)),
                      color: Colors.red,
                      
                    ),
                    child: Text("Kahvaltı",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),  ),
                    width: size.width * 0.70,
                    height: size.height * 0.10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                      color: Colors.blue,
                    ),
                    child: Text("Akşam Yemeği",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
                    width: size.width * 0.70,
                    height: size.height * 0.10,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: size.height*0.08),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 250,
                height: size.height*0.08,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YemekTablosuPage()),
                        ),
                    child: Text("Aylık Yemek Tablosu", style: TextStyle(fontSize: 20,color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
