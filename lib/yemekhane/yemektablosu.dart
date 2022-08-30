import 'package:flutter/material.dart';
import 'package:flutter_application_3/backgroundimage.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';

class YemekTablosuPage extends StatefulWidget {
  const YemekTablosuPage({ Key key }) : super(key: key);

  @override
  State<YemekTablosuPage> createState() => _YemekTablosuPageState();
}

class _YemekTablosuPageState extends State<YemekTablosuPage> {
  @override
  Widget build(BuildContext context) {
    background _background = background();
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
              Colors.black26,
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
            MaterialPageRoute(builder: (context) => YemekhanePage()),
          ),
        ),
      ),
      body: Container(
       decoration: BoxDecoration(
          image: DecorationImage(
            image: _background.image,
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,

      
    ),
    );
  }
}