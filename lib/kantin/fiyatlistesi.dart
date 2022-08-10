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
        backgroundColor: Colors.grey,
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
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.width * 0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
        ),
        width: size.width * 0.85,
        height: size.height * 0.80,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 250,
                child: TextButton(
                    
                        
                    child: Text(
                      "Fiyat Listesi Burası",
                      style: TextStyle(fontSize: 20),
                    ))),
            
          ],
        ),
      ),
    );
  }
}