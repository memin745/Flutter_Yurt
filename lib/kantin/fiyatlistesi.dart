import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/kantin/kantin.dart';

class FiyatListesiPage extends StatefulWidget {
  const FiyatListesiPage({ Key key }) : super(key: key);

  @override
  State<FiyatListesiPage> createState() => _FiyatListesiPageState();
}

class _FiyatListesiPageState extends State<FiyatListesiPage> {
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
            image: AssetImage("assets/i4.jpeg"),
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
                      "Fiyat Listesi Burası",
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ))),
            
          ],
        ),
      ),
    );
  }
}