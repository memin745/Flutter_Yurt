import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/profil/izinislemleri.dart';
import 'package:flutter_application_3/profil/profilkullan%C4%B1c%C4%B1.dart';
import 'package:flutter_application_3/profil/yurtfaaliyetleri.dart';


class ProfilGirisPage extends StatefulWidget {
  const ProfilGirisPage({Key key}) : super(key: key);

  @override
  State<ProfilGirisPage> createState() => _ProfilGirisPageState();
}

class _ProfilGirisPageState extends State<ProfilGirisPage> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Şehit Furkan Doğan Yurdu"),
        
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.width * 0.06),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
        width: size.width * 0.85,
        height: size.height * 70,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: size.width * 0.50,
                    height: size.height * 0.08,
                    child: TextButton(
                        onPressed: () => Navigator.pushReplacement(
                              //Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilKullaniciPage()),
                            ),
                        child: Text("Kullanıcı Bilgileri",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: size.width * 0.20,
                  height: size.height * 0.08,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ],
            ),
            width: size.width * 0.70,
            height: size.height * 0.08,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey),
            width: size.width * 0.70,
            height: size.height * 0.08,
            child: TextButton(
                onPressed: () => Navigator.pushReplacement(
                      //Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YurtFaaliyetleriPage()),
                    ),
                child: Text("Yurt Faaliyetleri",
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.grey),
              width: size.width * 0.70,
              height: size.height * 0.08,
              child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IzinIslemleriPage()),
                      ),
                  child: Text("İzin İşlemleri",
                      style: TextStyle(fontSize: 20, color: Colors.white)))),
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.grey),
              width: size.width * 0.70,
              height: size.height * 0.08,
              child: TextButton(
                  onPressed: () => {},
                  child: Text("Çıkış",
                      style: TextStyle(fontSize: 20, color: Colors.white)))),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            padding: EdgeInsets.only(left: size.height * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: size.width * 0.20,
                height: size.height * 0.08,
                margin: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.call,
                  size: 50,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: size.width * 0.20,
                height: size.height * 0.08,
                child: Icon(
                  Icons.mail,
                  size: 50,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: size.width * 0.20,
                height: size.height * 0.08,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
