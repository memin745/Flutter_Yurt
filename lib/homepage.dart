import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/kantin/kantin.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person)
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
          
       
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
        centerTitle: true,
        leading: Container(
            width: 200,
            height: 50,
            child: Image(
              image: AssetImage("assets/iycc.png"),
            )),
        leadingWidth: 200,
        title: Text("Şehit Furkan Doğan"),
      ),
      body: Container(padding: EdgeInsets.only(top: size.width*0.02),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3.jpg"),
            fit: BoxFit.cover,
          ),
      ),
        child: Column(
          children: [
            Container(margin: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(width: 2)),
              child: SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  dotSize: 6.0,
                  dotSpacing: 15.0,
                  dotPosition: DotPosition.bottomCenter,
                  images: [
                    Image.asset('assets/test.png', fit: BoxFit.cover),
                    Image.asset('assets/test.png', fit: BoxFit.cover),
                    Image.asset('assets/test.png', fit: BoxFit.cover),
                    Image.asset('assets/test.png', fit: BoxFit.cover),
                    Image.asset('assets/test.png', fit: BoxFit.cover),
                    Image.asset('assets/test.png', fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300].withOpacity(0.01)),
              width: size.width * 0.85,
              height: size.height * 0.27,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Duyurular",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white,
                  ),)),
                       Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Duyurular("Duyuru 1",context),
                Duyurular("Duyuru 2",context),
                Duyurular("Duyuru 3",context),
                Duyurular("Duyuru 4",context),
                Duyurular("Duyuru 5",context),
                Duyurular("Duyuru 6",context),
                Duyurular("Duyuru 7",context),
              ],
            ),
                       ),
                  
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.01),
              ),
              width: size.width * 0.85,
              height: size.height * 0.20,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent,),
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KantinPage()),),
                          child: Text(
                            "Kantin",
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent,),
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => YemekhanePage()),),
                          child:
                              Text("Yemekhane", style: TextStyle(fontSize: 20,color: Colors.black)))),
                ],
              ),
            ),
            
          ],
        ),
      ),
        
    );
  }
}