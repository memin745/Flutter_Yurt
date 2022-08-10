import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class ProfilKullaniciPage extends StatefulWidget {
  const ProfilKullaniciPage({Key key}) : super(key: key);

  @override
  State<ProfilKullaniciPage> createState() => _ProfilKullaniciPageState();
}

class _ProfilKullaniciPageState extends State<ProfilKullaniciPage> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
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
            MaterialPageRoute(builder: (context) => ProfilGirisPage()),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.width * 0.06),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
        width: size.width * 0.85,
        height: size.height * 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                  Icons.person,
                  size: 50,
              ),
            ),
           Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:KullaniciProfil("İsim Soyisim", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:KullaniciProfil("Şehir", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:KullaniciProfil("Üniversite ", context),
                ), 
                Padding(
                padding: const EdgeInsets.all(8),
                child:KullaniciProfil("Bölüm", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:KullaniciProfil("Sınıf", context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:KullaniciProfil("Oda Bilgileri", context),
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
Widget KullaniciProfil(String title,context){ Size size = MediaQuery.of(context).size;
  return Container(
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              
              ),
              width: size.width*0.50,
              height: size.height *0.08,
              padding: EdgeInsets.only(top: 25),
              child:Text(title ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 20, color: Colors.white),
           ),
            );
}