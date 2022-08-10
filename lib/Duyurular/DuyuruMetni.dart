import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/homepage.dart';


class DuyuruMetniPage extends StatefulWidget {
  const DuyuruMetniPage({ Key key }) : super(key: key);

  @override
  State<DuyuruMetniPage> createState() => _DuyuruMetniPageState();
  
}

class _DuyuruMetniPageState extends State<DuyuruMetniPage> {
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyurularSayfasiPage()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text("Duyurular",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(
            margin: EdgeInsets.only(top:size.height *0.02),
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15),image: DecorationImage(
          image: AssetImage(
              'assets/test.png'),
          fit: BoxFit.fill,),
            ),
            width: size.width * 0.60,
            height: size.height *0.30,
          ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.20,
              child: TextButton(onPressed: () {},
              child: Text("Duyuru metni",style:TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}