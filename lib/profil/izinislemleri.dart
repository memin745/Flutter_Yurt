import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';
import 'package:flutter_application_3/status_service.dart';

class IzinIslemleriPage extends StatefulWidget {
  const IzinIslemleriPage({Key key}) : super(key: key);

  @override
  State<IzinIslemleriPage> createState() => _IzinIslemleriPageState();
}

class _IzinIslemleriPageState extends State<IzinIslemleriPage> {
  String name;

  void getData() async {
    User user = await FirebaseAuth.instance.currentUser;
    var vari = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((vari) => setState(() {
              name = vari.data()['İsim Soyisim'];
            }));
  }

  String myEmail;
  List<String> docIds = [];

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    StatusServiceIzinler _statusServiceIzinler = StatusServiceIzinler();
    int _currentIndex = 0;
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/i4.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            width: size.width * 1,
            height: size.height * 1,
            child: StreamBuilder<QuerySnapshot>(
              stream: _statusServiceIzinler.getStatus(),
              builder: (context, snaphot) {
                return !snaphot.hasData
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: snaphot.data.docs.length,
                        // ignore: missing_return
                        itemBuilder: (context, index) {
                          DocumentSnapshot mypost =
                              snaphot.data.docs[index] ?? '';
                              String isim ="${mypost['Ogrenci']}";

                          Future<void> _showChoiseDialog(
                              BuildContext context) {}
                              if(isim == name){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                _showChoiseDialog(context);
                              },
                             
                             child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFeeeee0),
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                        
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DataTable(columns: [
                                        DataColumn(
                                          label: Text('Gidiş'),
                                        ),
                                        DataColumn(
                                          label: Text('Dönüş'),
                                        ),
                                        DataColumn(
                                          label: Text('Şehir'),
                                        ),
                                      ], rows: [
                                        DataRow(cells: [
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              "${mypost['Gidis']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              "${mypost['Donus']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                           
                                            child: Text(
                                              "${mypost['Sehir']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                        ])
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        }
                        );
              },
            )));
  }
}
