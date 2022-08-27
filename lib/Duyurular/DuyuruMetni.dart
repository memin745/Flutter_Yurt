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
         flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.white,
              Color(0xFF808080),
              Colors.blueGrey,

            ],
          ),
        ),
      ),
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
              padding: EdgeInsets.only(top: 15),
              child: Text("Duyurular",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
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
                width: size.width * 10,
                height: size.height * 0.40,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",textAlign: TextAlign.center, style:TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),)
                  ],
                ),
              
              
              ),
            
            
          ],
        ),
        
      ),
    );
  }
}