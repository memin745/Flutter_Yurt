import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/basvurular.dart';
import 'package:flutter_application_3/izinbasvuru/izinalma.dart';

class IzinveBasvuruPage extends StatefulWidget {
  const IzinveBasvuruPage({Key key}) : super(key: key);

  @override
  State<IzinveBasvuruPage> createState() => _IzinveBasvuruPageState();
}

class _IzinveBasvuruPageState extends State<IzinveBasvuruPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
        title: Text("Şehit Furkan Doğan Yurdu"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(
                    0xFFeeeee0,
                  ),
                ),
                width: 250,
                height: size.height * 0.08,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BavurularPage()),
                        ),
                    child: Text(
                      "Başvurular",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ))),
            Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(
                    0xFFeeeee0,
                  ),
                ),
                width: 250,
                height: size.height * 0.08,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IzinAlmaPage()),
                        ),
                    child: Text("İzin İşlemleri",
                        style: TextStyle(fontSize: 20, color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
