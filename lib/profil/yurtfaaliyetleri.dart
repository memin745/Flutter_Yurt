import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/status_service.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class YurtFaaliyetleriPage extends StatefulWidget {
  const YurtFaaliyetleriPage({Key key}) : super(key: key);

  @override
  State<YurtFaaliyetleriPage> createState() => _YurtFaaliyetleriPageState();
}

class _YurtFaaliyetleriPageState extends State<YurtFaaliyetleriPage> {
  @override
  Widget build(BuildContext context) {
    String name = "Name Loading...";
    String email = "Email Loading...";
    String Telefon = "Telefon Loading...";
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

    @override
    void initState() {
      getData();
      super.initState();
    }

    StatusServiceBasvuru _statusServiceBasvuru= StatusServiceBasvuru();
    background _background = background();
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: appbarContainer(),
          title: baslikTitle(),
          automaticallyImplyLeading: false,
          leading: backIconButton(
            page: ProfilGirisPage(),
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
                  image: _background.image,
                  fit: BoxFit.cover,
                ),
              ),
              width: size.width * 1,
              height: size.height * 1,
              child: StreamBuilder<QuerySnapshot>(
                stream: _statusServiceBasvuru.getStatus(),
                builder: (context, snaphot) {
                  return !snaphot.hasData
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: snaphot.data.docs.length,
                          // ignore: missing_return
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
                                    decoration: BoxDecoration(
                                        color: Color(0xFFeeeee0),
                                        border: Border.all(
                                            color: Colors.blue, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          DataTable(columns: [
                                            DataColumn(
                                              label: Text(
                                                  "Duyuru Adı"),
                                            ),
                                           
                                          ], rows: [
                                            DataRow(cells: [
                                              DataCell(Container(
                                                child: Text(
                                                  "${mypost['Duyuru Adi']}",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                  textAlign: TextAlign.start,
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
                            
                          });
                },
              ),
            )));
  }
}
