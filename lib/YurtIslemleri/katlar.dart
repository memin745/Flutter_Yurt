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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/i4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text("Yurt İşlemleri",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Container(
              
            ),
            Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("1. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("2. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("3. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("4. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("5. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("6. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("7. Kat",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Katlar("8. Kat",context),
                ),
              ],
            )
          )
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
                  decoration: BoxDecoration(color: Color(0xFFeeeee0),borderRadius: BorderRadius.circular(15)),
                  width: 336,
                  height: 71,
                  child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OdalarPage()),
        ),
                  child: Text(title,style:TextStyle(fontSize: 20,color: Colors.black),),
                  ),
                ),
    ],
  );
}