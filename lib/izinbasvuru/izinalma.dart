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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/i4.jpeg"),
            fit: BoxFit.cover,
          ),
      ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.10),
            width: size.width * 0.70,
            height: size.height * 0.07,
            child: Row(children: [
              IzinAlma("Gidiş Tarihi", context, 0),
               Container(
                padding:  EdgeInsets.only(left: size.width * 0.02),
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Color(0xFFeeeee0,),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child:TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Gidiş Tarihi',
                    ),
                  ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IzinAlma("Geliş Tarihi", context, 0),
              Container(
                padding:  EdgeInsets.only(left: size.width * 0.02),
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Color(0xFFeeeee0,),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child:TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Geliş Tarihi',
                    ),
                  ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IzinAlma("Şehir", context,0),
               Container(
                padding:  EdgeInsets.only(left: size.width * 0.02),
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Color(0xFFeeeee0,),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child:TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Şehir',
                    ),
                  ),
              ),
            ]),
          ),
          IzinAlma("Basvur", context,0.10),
        ]),
      ),
    );
  }
}
Widget IzinAlma(String title,context, double bosluk){
  Size size = MediaQuery.of(context).size;
  return Container(
            margin: EdgeInsets.only(top: size.width * bosluk),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFFeeeee0,),),
            padding: EdgeInsets.only(top: 5),
            child: Text(title,textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
            width: size.width * 0.30,
                height: size.height * 0.05,
          );
}
