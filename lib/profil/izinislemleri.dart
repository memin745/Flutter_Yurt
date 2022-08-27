import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class IzinIslemleriPage extends StatefulWidget {
  const IzinIslemleriPage({ Key key }) : super(key: key);

  @override
  State<IzinIslemleriPage> createState() => _IzinIslemleriPageState();
}

class _IzinIslemleriPageState extends State<IzinIslemleriPage> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilGirisPage()),
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
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("İzin Geçmişi",style: TextStyle(fontSize: 20,color: Colors.white),

              ),
            ),
            Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:IzinIslemleri("İzinler",context),
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
Widget IzinIslemleri(String title,context){ 
  void _showDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.pink[100],
        title: Text('İşin İşlemleri'),
        content: Text("İzin Geçmişi"),
        actions: [
          MaterialButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      );
    });
  }
  Size size = MediaQuery.of(context).size;
return Container( 
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFFeeeee0)),
              width: 200,
              height: 50,
              child: TextButton( onPressed: _showDialog,
              child: Text(title,style: TextStyle(fontSize: 20,color: Colors.black),
              ), 
              ), 
              
            );
  
}

  
    