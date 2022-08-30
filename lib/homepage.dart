import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/slider.dart';
import 'package:flutter_application_3/Options/status_service.dart';
import 'package:flutter_application_3/kantin/kantin.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person)
  ];
  @override
  Widget build(BuildContext context) {
    background _background = background();
    duyuru _duyuru = duyuru();
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    StatusService _statusService = StatusService();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        centerTitle: true,
        leading: Container(
            width: 200,
            height: 50,
            child: Image(
              image: AssetImage("assets/iycc.png"),
            )),
        leadingWidth: 200,
        title: Text("Şehit Furkan Doğan"),
      ),
      body: Shimmer(
        duration: Duration(seconds: 10),
        interval: Duration(seconds: 5),
        color: Color(0xFFCEEEFF),
        colorOpacity: 0.3,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
            padding: EdgeInsets.only(top: size.width * 0.02),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _background.image,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tablet.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: SizedBox(
                    height: 200.0,
                    width: double.infinity,
                    child: slider(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300].withOpacity(0.01),
                  ),
                  width: size.width * 0.90,
                  height: size.height * 0.30,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Duyurular",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      Expanded(
                        child: duyuru(size: size/2, statusService: _statusService,)
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.01),
                  ),
                  width: size.width * 0.85,
                  height: size.height * 0.15,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 25, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(
                              0xFFeeeee0,
                            ),boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.50),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    )
                  ]
                          ),
                          width: size.width * 0.35,
                          child: TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                    //Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KantinPage()),
                                  ),
                              child: Text(
                                "Kantin",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.black),
                              ))),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFeeeee0),boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.50),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    )
                  ]
                          ),
                          width: size.width * 0.35,
                          child: TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                    //Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => YemekhanePage()),
                                  ),
                              child: Text("Yemekhane",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}



