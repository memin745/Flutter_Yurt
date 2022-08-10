import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyuruMetni.dart';
import 'package:flutter_application_3/homepage.dart';


class DuyurularSayfasiPage extends StatefulWidget {
  const DuyurularSayfasiPage({ Key key }) : super(key: key);

  @override
  State<DuyurularSayfasiPage> createState() => _DuyurularSayfasiPageState();
}

class _DuyurularSayfasiPageState extends State<DuyurularSayfasiPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Şehit Furkan Doğan Yurdu"),

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
              padding: EdgeInsets.only(top: 15),
              child: Text("Duyurular",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(
              
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
        ),
              child: Text("Duyuru 1",style:TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
        ),
              child: Text("Duyuru 2",style:TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
        ),
              child: Text("Duyuru 3",style:TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
        ),
              child: Text("Duyuru 4",style:TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
        ),
              child: Text("Duyuru 5",style:TextStyle(fontSize: 20),),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}