import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/storage_servis.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/basvurular.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';

class BasvurularimPage extends StatefulWidget {
  final String takenvalue;
  final String postValue;
  final String postValue2;
  final String imageValue;
  const BasvurularimPage(
      {Key key,
      this.takenvalue,
      this.postValue,
      this.postValue2,
      this.imageValue})
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
    StorageDuyuru storageDuyuru = StorageDuyuru();
    Future<void> _showChoiseDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  "Başvuru yapmak istediğinize emin misiniz?",
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                content: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            Map<String, String> movieData = {};
                            FirebaseAuth.instance;
                            await _firestore
                                .collection("AlinanBasvurular")
                                .doc(widget.postValue2)
                                .set({
                              "ogrenci": FieldValue.arrayUnion([name]),
                              "Duyuru Adi": widget.postValue2,
                              "Email": FieldValue.arrayUnion([email]),
                              "Telefon": FieldValue.arrayUnion([Telefon]),
                              'Email': FirebaseAuth.instance.currentUser.email,
                            }, SetOptions(merge: true));
                            Fluttertoast.showToast(
                                msg: "Başvuru Yapıldı",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.amber,
                                textColor: Colors.white,
                                fontSize: 15);
                            Navigator.pushReplacement(
                              //Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainLayout()),
                            );
                          },
                          child: Text(
                            "Evet",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Vazgeç",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )));
          });
    }

    background _background = background();
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        title: baslikTitle(),
        automaticallyImplyLeading: false,
        leading: backIconButton(
          page: BavurularPage(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _background.image,
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
                borderRadius: BorderRadius.circular(15),
              ),
              child: FutureBuilder(
                future: storageDuyuru.downloadURL("${widget.imageValue}"),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Container(
                        width: size.width * 0.3,
                        height: size.height * 0.3,
                        child: PhotoView(
                          imageProvider: NetworkImage(
                            snapshot.data,
                          ),
                          minScale: PhotoViewComputedScale.contained * 1.2,
                          maxScale: PhotoViewComputedScale.covered * 2,
                          enableRotation: false,
                        ));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return Container();
                },
              ),
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
                    widget.imageValue,
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
              width: size.width * 0.45,
              height: size.height * 0.08,
              margin: EdgeInsets.only(
                top: size.height * 0.05,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 47, 194, 62),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.50),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: TextButton(
                onPressed: () async {
                  scheduleAlarm();
                },
                child: Text(
                  "Başvur",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      channelDescription: 'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(0, "Günaydın", "Naber",
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
