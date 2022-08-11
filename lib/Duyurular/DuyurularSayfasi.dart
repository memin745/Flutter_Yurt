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
        backgroundColor: Color(0xFF808080),
        title: Text("Şehit Furkan Doğan Yurdu"),
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
            image: AssetImage("assets/3.jpg"),
            fit: BoxFit.cover,
          ),
      ),
       
        
        
        width: MediaQuery.of(context).size.width,
        height: size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text("Duyurular",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white),),
            ),
            
            Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 1", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 2 ", context),
                ), 
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 3", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 4", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 5", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 6 ", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Duyurular("Duyuru 7", context),
                ),
              ],
            )
          )
            
          ],
        ),
      ),
    );
  }
}
Widget Duyurular(String title, context){Size size = MediaQuery.of(context).size;
   return Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.redAccent[100],borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.70,
              height: size.height * 0.10,
              child: TextButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
        ),
              child: Text(title,style:TextStyle(fontSize: 20,color: Colors.black),),
              ),
            );
}