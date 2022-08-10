import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/izinvebasvuru.dart';


class IzinAlmaPage extends StatefulWidget {
  const IzinAlmaPage({Key key}) : super(key: key);

  @override
  State<IzinAlmaPage> createState() => _IzinAlmaPageState();
}

class _IzinAlmaPageState extends State<IzinAlmaPage> {
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
            MaterialPageRoute(builder: (context) => IzinveBasvuruPage()),
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
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.10),
            width: size.width * 0.70,
            height: size.height * 0.07,
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child: Text(
                  "Gidiş Tarihi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child: Text(
                  "Geliş Tarihi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child: Text(
                  "Şehir",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * 0.10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
            padding: EdgeInsets.only(top: 5),
            child: Text("Başvur",textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
            width: size.width * 0.30,
                height: size.height * 0.05,
          )
        ]),
      ),
    );
  }
}
