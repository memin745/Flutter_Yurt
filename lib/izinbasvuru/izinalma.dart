import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/izinvebasvuru.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IzinAlmaPage extends StatefulWidget {
  const IzinAlmaPage({Key key}) : super(key: key);

  @override
  State<IzinAlmaPage> createState() => _IzinAlmaPageState();
}

class _IzinAlmaPageState extends State<IzinAlmaPage> {
  final _firestore = FirebaseFirestore.instance;

  TextEditingController gidisController = TextEditingController();
  TextEditingController donusController = TextEditingController();
  TextEditingController izinSehirController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  DateTime _dateTime2 = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

  void _showDatePicker2() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime2 = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference izinRef = _firestore.collection('Izinler');

    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
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
            image: AssetImage("assets/i4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.10),
            height: size.height * 0.07,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IzinAlma("Gidiş Tarihi", context, 0),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.02),
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Color(
                      0xFFeeeee0,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.35,
                height: size.height * 0.05,
                child: TextButton(
                  child: Text(
                    _dateTime.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onPressed: _showDatePicker2,
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IzinAlma("Dönüş Tarihi", context, 0),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.02),
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Color(
                      0xFFeeeee0,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.35,
                height: size.height * 0.05,
                child: TextButton(
                  child: Text(
                    _dateTime2.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onPressed: _showDatePicker,
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IzinAlma("Şehir", context, 0),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.02),
                margin: EdgeInsets.only(left: size.width * 0.08),
                decoration: BoxDecoration(
                    color: Color(
                      0xFFeeeee0,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                width: size.width * 0.30,
                height: size.height * 0.05,
                child: TextField(
                  controller: izinSehirController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Şehir',
                  ),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(left: size.width * 0.02),
            margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
            decoration: BoxDecoration(
                color: Color(0xFFff0000),
                borderRadius: BorderRadius.circular(20)),
            width: size.width * 0.25,
            height: size.height * 0.08,
            child: TextButton(
              onPressed: () async {
                print(gidisController.text);
                print(donusController.text);
                print(izinSehirController.text);

                Map<String, String> movieData = {
                  'gidis': gidisController.text,
                  'donus': donusController.text,
                };
                String sehir = izinSehirController.text;
                String gidis = _dateTime.toString();
                String donus = _dateTime2.toString();
                await izinRef.doc().set(
                    {'Sehir': '$sehir', 'Gidis': '$gidis', 'Donus': '$donus'});
                    Fluttertoast.showToast(msg: "İzin Gönderildi",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             timeInSecForIosWeb: 5,
             backgroundColor: Colors.amber,
             textColor: Colors.white,
             fontSize: 15);
             Navigator.pushReplacement(
              //Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IzinAlmaPage()));
              },
              
              child: Text(
                "Bildir",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget IzinAlma(String title, context, double bosluk) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: size.width * bosluk),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(
        0xFFeeeee0,
      ),
    ),
    padding: EdgeInsets.only(top: 5),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
    ),
    width: size.width * 0.30,
    height: size.height * 0.05,
  );
}
