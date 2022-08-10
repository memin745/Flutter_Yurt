import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Container(
            width: 200,
            height: 50,
            child: Image(
              image: AssetImage("assets/iycc.png"),
            )),
        leadingWidth: 200,
        title: Text("Şehit Furkan Doğan Yurdu"),
      ),
      body: Container(padding: EdgeInsets.only(top: size.width*0.02),
        child: Column(
          children: [
            SizedBox(
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
            Container(
              margin: EdgeInsets.only(top: size.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300]),
              width: size.width * 0.85,
              height: size.height * 0.23,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Duyurular",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                       Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Duyuru("Duyuru 1"),
                Duyuru("Duyuru 2"),
                Duyuru("Duyuru 3"),
                Duyuru("Duyuru 4"),
                Duyuru("Duyuru 5"),
                Duyuru("Duyuru 6"),
                Duyuru("Duyuru 7"),
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
                color: Colors.grey[300],
              ),
              width: size.width * 0.85,
              height: size.height * 0.20,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                      color: Colors.white,),
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KantinPage()),),
                          child: Text(
                            "Kantin",
                            style: TextStyle(fontSize: 20),
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                      color: Colors.white,),
                      width: 250,
                      child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => YemekhanePage()),),
                          child:
                              Text("Yemekhane", style: TextStyle(fontSize: 20)))),
                ],
              ),
            ),
            
          ],
        ),
      ),
        
    );
  }
}

Widget Duyuru(String title){
 return Padding(
                padding: const EdgeInsets.all(8),
                child:Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                    color: Colors.white,),
                      margin: EdgeInsets.only(top: 10),
                      width: 250,
                      
                      child:
                          TextButton(onPressed: () {}, child: Text(title,style: TextStyle(fontSize: 18,color: Colors.black),))),
                          
                );
}