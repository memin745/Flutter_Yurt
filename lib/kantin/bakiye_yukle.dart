import 'package:flutter/material.dart';
import 'package:flutter_application_3/kantin/kantin.dart';
import 'package:photo_view/photo_view.dart';
class BakiyeYuklePage extends StatefulWidget {
  const BakiyeYuklePage({ Key key }) : super(key: key);

  @override
  State<BakiyeYuklePage> createState() => _BakiyeYuklePageState();
}

class _BakiyeYuklePageState extends State<BakiyeYuklePage> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
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
              height: 500,
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(
                    0xFFeeeee0,
                  ),
                ),
                width: 400,
                child:  PhotoView(
      imageProvider: AssetImage("assets/3.jpg"),
    )),
            
          ],
        ),
      ),
    );
  }
}