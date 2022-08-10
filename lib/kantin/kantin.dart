import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/YurtIslemleri/odalar.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/izinvebasvuru.dart';
import 'package:flutter_application_3/kantin/%C3%B6demeyap.dart';
import 'package:flutter_application_3/kantin/bakiye_yukle.dart';
import 'package:flutter_application_3/kantin/fiyatlistesi.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class KantinPage extends StatefulWidget {
  const KantinPage({Key key}) : super(key: key);

  @override
  State<KantinPage> createState() => _KantinPageState();
}

class _KantinPageState extends State<KantinPage> {
  int _selectedIndex = 0;  
    static const List<Widget> _widgetOptions = <Widget>[ 
      HomePage(), 
      IzinveBasvuruPage(),
      YurtIslemleriPage(),
      DuyurularSayfasiPage(),
      ProfilGirisPage()
  ]; 
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    }); 
    }
    Size size = MediaQuery.of(context).size;
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
            MaterialPageRoute(builder: (context) => HomePage()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 250,
                height: size.height*0.08,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FiyatListesiPage()),
                        ),
                    child: Text(
                      "Fiyat Listesi",
                      style: TextStyle(fontSize: 20),
                    ))),
            Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: 250,
                height: size.height*0.08,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OdemelerPage()),
                        ),
                    child: Text("Ödeme Yap", style: TextStyle(fontSize: 20)))),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: 250,
              height: size.height*0.08,
              child: TextButton(
                  child: TextButton(
                      onPressed: () => Navigator.pushReplacement(
                            //Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BakiyeYuklePage()),
                          ),
                      child: Text("Bakiye Yükle",
                          style: TextStyle(fontSize: 20)))),
            ),
          ],
        ),
      ),
    );
  }
}
