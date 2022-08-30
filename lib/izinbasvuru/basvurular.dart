import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/status_service.dart';

import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/basvurularim.dart';
import 'package:flutter_application_3/izinbasvuru/izinvebasvuru.dart';


class BavurularPage extends StatefulWidget {
  const BavurularPage({Key key}) : super(key: key);

  @override
  State<BavurularPage> createState() => _BavurularPageState();
}

class _BavurularPageState extends State<BavurularPage> {
  StatusServicebasvurular _statusServicebasvurular = StatusServicebasvurular();
  @override
  Widget build(BuildContext context) {
    background _background = background();
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
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
            MaterialPageRoute(builder: (context) => IzinveBasvuruPage()),
          ),
          icon: new Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _background.image,
            fit: BoxFit.cover,
          ),
        ),
        child: Scrollbar(
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: StreamBuilder<QuerySnapshot>(
            stream: _statusServicebasvurular.getStatus(),
            builder: (context, snaphot) {
              return !snaphot.hasData
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: snaphot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost =
                            snaphot.data.docs[index] ?? '';
                        String postValue = "${mypost['Basvuru Icerik']}";
                        String postValue2 = "${mypost['Başvuru Adi']}";
                        Future<void> _showChoiseDialog(BuildContext context) {}

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
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
                                                  BasvurularimPage(
                                                      takenvalue:
                                                          index.toString(),
                                                      postValue: postValue,
                                                      postValue2: postValue2)),
                                        ),
                                        child: Text(
                                          "${mypost['Başvuru Adi']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                                  BasvurularimPage(
                                                      takenvalue:
                                                          index.toString(),
                                                      postValue: postValue,
                                                      postValue2: postValue2)),
                                        ),
                                        child: Text(
                                          "${mypost['Tarih']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                  ),
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
    );
  }
}

Widget Basvurular(String title, context) {
  Size size = MediaQuery.of(context).size;
  return Container(
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
                MaterialPageRoute(builder: (context) => BasvurularimPage()),
              ),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          )));
}
