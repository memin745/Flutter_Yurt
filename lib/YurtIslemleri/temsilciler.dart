import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/status_service.dart';
import 'package:flutter_application_3/Options/temsilciContainerClass.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';

import 'package:flutter_application_3/homepage.dart';

class TemsilcilerPage extends StatefulWidget {
  const TemsilcilerPage({Key key}) : super(key: key);

  @override
  State<TemsilcilerPage> createState() => _TemsilcilerPageState();
}

class _TemsilcilerPageState extends State<TemsilcilerPage> {
  @override
  Widget build(BuildContext context) {
    StatusServiceUsers _statusServiceUsers = StatusServiceUsers();
    background _background = background();
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: appbarContainer(),
          title: baslikTitle(),
          automaticallyImplyLeading: false,
          leading: backIconButton(
            page: YurtIslemleriPage(),
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
          child: StreamBuilder<QuerySnapshot>(
              stream: _statusServiceUsers.getStatus(),
              builder: (context, snaphot) {
                return !snaphot.hasData
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: snaphot.data.docs.length,
                        // ignore: missing_return
                        itemBuilder: (context, index) {
                          DocumentSnapshot mypost =
                              snaphot.data.docs[index] ?? '';
                              
                         
                         
                          print(FirebaseAuth.instance.currentUser.uid);
                          Future<void> _showChoiseDialog(
                              BuildContext context) {}
                        if(mypost['Temsilci'] == true){
                          
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Temsilciler(mypost["İsim Soyisim"], mypost["Oda"], mypost["Telefon"], context),
                              
                            );
                            
                        }
                        else{
                          mypost['Temsilci']== true;
                          return Text("",style: TextStyle(fontSize: 1),);
                          
                        }
                      
                        });
              },
            )));
  }
}
