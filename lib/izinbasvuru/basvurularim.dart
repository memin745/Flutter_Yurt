import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/basvurular.dart';


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
        backgroundColor: Color(0xFF808080),
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BavurularPage()),
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
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
                width: size.width * 0.80,
                height: size.height * 0.30,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",textAlign: TextAlign.center, style:TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white),),)
                  ],
                ),
              
              
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
