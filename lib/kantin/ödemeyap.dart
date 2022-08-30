import 'package:flutter/material.dart';
import 'package:flutter_application_3/backgroundimage.dart';
import 'package:flutter_application_3/kantin/kantin.dart';

class OdemelerPage extends StatefulWidget {
  const OdemelerPage({ Key key }) : super(key: key);

  @override
  State<OdemelerPage> createState() => _OdemelerPageState();
}

class _OdemelerPageState extends State<OdemelerPage> {
  @override
  Widget build(BuildContext context) {
    background _background = background();
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
            MaterialPageRoute(builder: (context) => KantinPage()),
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFeeeee0),
                ),
                width: 250,
                child: TextButton(
                    
                        
                    child: Text(
                      "Ödeme Ekranı",
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ))),
            
          ],
        ),
      ),
    );
  }
}