import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';


class BasvurularimPage extends StatefulWidget {
  const BasvurularimPage({Key key}) : super(key: key);

  @override
  State<BasvurularimPage> createState() => _BasvurularimPageState();
}

class _BasvurularimPageState extends State<BasvurularimPage> {
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
            MaterialPageRoute(builder: (context) => HomePage()),
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
          children: [Container(
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
            margin: EdgeInsets.only(top: size.height * 0.03),
            padding: EdgeInsets.only(top: size.height *0.06),
            width: size.width *0.75,
            height: size.height *0.20,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
            child: Text("Etkinlik ile Bilgiler",textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: Colors.white),),
          ),
          Container(
            width: size.width * 0.35,
            height: size.height*0.06,
            margin:EdgeInsets.only(top: size.height * 0.05,),
            decoration: BoxDecoration(borderRadius : BorderRadius.circular(20),color: Colors.white),
            child: TextButton(
              onPressed: () {}, child: Text("Basvur",style: TextStyle(fontSize: 22,color: Colors.black),
              ),
              
            ),
          ),
          
          ],
        ),
      ),
    );
  }
}
