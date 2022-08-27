import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyuruMetni.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/status_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DuyurularSayfasiPage extends StatefulWidget {
  const DuyurularSayfasiPage({Key key}) : super(key: key);

  @override
  State<DuyurularSayfasiPage> createState() => _DuyurularSayfasiPageState();
}

class _DuyurularSayfasiPageState extends State<DuyurularSayfasiPage> {
  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    var size = MediaQuery.of(context).size;

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
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          ),
          icon: new Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: LiquidPullToRefresh(
        color: Colors.blue[400],
        height: size.height * 0.2,
        backgroundColor: Colors.black26,
        onRefresh: _handleRefresh,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/i4.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
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
                          String postValue = "${mypost['Metin']}";

                          Future<void> _showChoiseDialog(
                              BuildContext context) {}

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                _showChoiseDialog(context);
                              },
                              child: Container(
                                height: size.height * .2,
                                decoration: BoxDecoration(
                                    color: Color(0xFFeeeee0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.50),
                                        blurRadius: 20,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        child: TextButton(
                                          onPressed: () =>
                                              Navigator.pushReplacement(
                                            //Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DuyuruMetniPage(
                                                      postValue: postValue,
                                                    )),
                                          ),
                                          child: Text(
                                            postValue,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
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
      ),
    );
  }
}

Widget Duyurular(String title, context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    decoration: BoxDecoration(
        color: Color(0xFFeeeee0), borderRadius: BorderRadius.circular(15)),
    width: size.width * 0.70,
    height: size.height * 0.09,
    child: TextButton(
      onPressed: () => Navigator.pushReplacement(
        //Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DuyuruMetniPage()),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ),
  );
}
