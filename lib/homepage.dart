import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/kantin/kantin.dart';
import 'package:flutter_application_3/status_service.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    StatusService _statusService = StatusService();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.black26,
                Colors.blueGrey,
              ],
            ),
          ),
        ),
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
        duration: Duration(seconds: 3),
        interval: Duration(seconds: 5),
        color: Colors.white,
        colorOpacity: 0.3,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: LiquidPullToRefresh(
          color: Colors.blueGrey[400],
          height: 300,
          backgroundColor: Colors.black26,
          onRefresh: _handleRefresh,
          animSpeedFactor: 2,
          showChildOpacityTransition: true,
          child: Container(
            padding: EdgeInsets.only(top: size.width * 0.02),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/i4.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tablet.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: SizedBox(
                    height: 200.0,
                    width: double.infinity,
                    child: Carousel(
                      dotSize: 6.0,
                      dotSpacing: 15.0,
                      dotPosition: DotPosition.bottomCenter,
                      images: [
                        Image.network('https://picsum.photos/200/300',
                            fit: BoxFit.cover),
                        Image.network('https://picsum.photos/200/300',
                            fit: BoxFit.cover),
                        Image.network('https://picsum.photos/200/300',
                            fit: BoxFit.cover),
                        Image.network('https://picsum.photos/200/300',
                            fit: BoxFit.cover),
                        Image.network('https://picsum.photos/200/300',
                            fit: BoxFit.cover),
                        Image.network('https://picsum.photos/200/300',
                            fit: BoxFit.cover),
                      ],
                    ),
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
                        child: Scrollbar(
                          showTrackOnHover: true,
                          isAlwaysShown: true,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: _statusService.getStatus(),
                            builder: (context, snaphot) {
                              return !snaphot.hasData
                                  ? CircularProgressIndicator()
                                  : ListView.builder(
                                      itemCount: snaphot.data.docs.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot mypost =
                                            snaphot.data.docs[index] ?? '';

                                        Future<void> _showChoiseDialog(
                                            BuildContext context) {}

                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              _showChoiseDialog(context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 15),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.50),
                                                      blurRadius: 20,
                                                      offset: Offset(0, 4),
                                                    )
                                                  ]),
                                              width: size.width * 10,
                                              height: size.height * 0.10,
                                              child: ListView(
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(
                                                        16.0),
                                                    child: Container(
                                                      child: Text(
                                                        "${mypost['Metin']}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w800),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                            },
                          ),
                        ),
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
      ),
    );
  }
}
