import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/basvurular.dart';

class BasvurularimPage extends StatefulWidget {
  final String takenvalue;
  final String postValue;
  final String postValue2;
  const BasvurularimPage(
      {Key key, this.takenvalue, this.postValue, this.postValue2})
      : super(key: key);

  @override
  State<BasvurularimPage> createState() => _BasvurularimPageState();
}

class _BasvurularimPageState extends State<BasvurularimPage> {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String name = "Name Loading...";
  String email = "Email Loading...";
  String Telefon = "Soyadı Loading...";
  String bolum = "Bölüm Loading...";
  String universite = "Universite Loading...";
  String oda = "Email Loading...";
  String sehir = "Şehir Loading...";
  String sinif = "Sınıf Loading...";
  String Tc = "Tc Loading...";
  void getData() async {
    User user = await FirebaseAuth.instance.currentUser;
    var vari = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((vari) => setState(() {
              name = vari.data()['İsim Soyisim'];
              email = vari.data()['Email'];
              Telefon = vari.data()['Telefon'];
              Tc = vari.data()['T.C'];
              universite = vari.data()['Üniversite'];
              oda = vari.data()['Oda'];
              sehir = vari.data()['Şehir'];
              sinif = vari.data()['Sınıf'];
              bolum = vari.data()['Bölüm'];
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
    CollectionReference basvuruRef = _firestore.collection("AlinanBasvurular");
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
              Colors.white,
              Color(0xFF808080),
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
            MaterialPageRoute(builder: (context) => BavurularPage()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/test.png'),
                  fit: BoxFit.fill,
                ),
              ),
              width: size.width * 0.60,
              height: size.height * 0.30,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              width: size.width * 0.80,
              height: size.height * 0.30,
              child: ListView(scrollDirection: Axis.vertical, children: [
                Container(
                  child: Text(
                    widget.postValue,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                )
              ]),
            ),
            Container(
              width: size.width * 0.35,
              height: size.height * 0.06,
              margin: EdgeInsets.only(
                top: size.height * 0.05,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: TextButton(
                onPressed: () async {
                  Map<String, String> movieData = {};
                  FirebaseAuth.instance;
                  await basvuruRef
                      .doc(widget.postValue2)
                      .set({"ogrenci":FieldValue.arrayUnion([name]),"Duyuru Adi":widget.postValue2,"Email":FieldValue.arrayUnion([email]),"Telefon":FieldValue.arrayUnion([Telefon]),},SetOptions(merge: true));
                },
                child: Text(
                  "Başvur",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
