import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/YurtIslemleri/odalar.dart';
import 'package:flutter_application_3/homepage.dart';

class KatlarPage extends StatefulWidget {
  const KatlarPage({ Key key }) : super(key: key);

  @override
  State<KatlarPage> createState() => _KatlarPageState();
}

class _KatlarPageState extends State<KatlarPage> {
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
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text("Yurt İşlemleri",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(
              
            ),
            Katlar("Kat 1",context),
            Katlar("Kat 2",context),
            Katlar("Kat 3",context),
            Katlar("Kat 4",context),
            Katlar("Kat 5",context),
          ]
        ),
        
      ),
      
    );
  }
}

Widget Katlar(String title,context){
  return Column(
    children: [
      Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(69)),
                  width: 336,
                  height: 71,
                  child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OdalarPage()),
        ),
                  child: Text(title,style:TextStyle(fontSize: 20),),
                  ),
                ),
    ],
  );
}