import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/izinvebasvuru.dart';


class BavurularPage extends StatefulWidget {
  const BavurularPage({Key key}) : super(key: key);

  @override
  State<BavurularPage> createState() => _BavurularPageState();
}

class _BavurularPageState extends State<BavurularPage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: Column(children: [
                Text(
                  "Güncel Başvurular",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ]),
            ),
             Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:Basvurular("Basvuru",context),
                ),
              ],
            )
          )

          ],
        ),
      ),
    );
  }
}
Widget Basvurular(String title,context){Size size = MediaQuery.of(context).size;
return Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 250,
                height: size.height * 0.08,
                child: TextButton(
                    child: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )));

}