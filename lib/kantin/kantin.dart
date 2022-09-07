import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
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
    background _background = background();
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(context),
      body: bodyContainer(size: size),
    );
  }

  AppBar Appbar(BuildContext context) {
    return AppBar(
      flexibleSpace: appbarContainer(),
      title: baslikTitle(),
      automaticallyImplyLeading: false,
      leading: new IconButton(
        icon: backIconButton(
          page: HomePage(),
        ),
      ),
    );
  }
}

class bodyContainer extends StatelessWidget {
  const bodyContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    background _background = background();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _background.image,
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
                color: Color(0xFFeeeee0),
              ),
              width: 250,
              height: size.height * 0.08,
              child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FiyatListesiPage()),
                      ),
                  child: Text(
                    "Fiyat Listesi",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFeeeee0),
                ),
                width: 250,
                height: size.height * 0.08,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OdemelerPage()),
                        ),
                    child: Text("Ödeme Yap",
                        style: TextStyle(fontSize: 20, color: Colors.black)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFeeeee0),
            ),
            width: 250,
            height: size.height * 0.08,
            child: TextButton(
                child: TextButton(
              onPressed: () => Navigator.pushReplacement(
                //Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BannerSlider()),
              ),
              child: Text("Bakiye Yükle",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            )),
          ),
        ],
      ),
    );
  }
}
