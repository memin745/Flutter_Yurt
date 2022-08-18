import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  String documentId;
  
  GetUserName({this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          if (data['userId'] == FirebaseAuth.instance.currentUser.uid) {
            return Container(
                decoration: BoxDecoration(color: Colors.red),
                width: 250,
                height: 100,
                child: Text(
                  'Adı: ${data['soyadi']}' + ' ${data['soyadi']}',
                  style: TextStyle(fontSize: 25),
                ),);
          }
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          if (data['userId'] == FirebaseAuth.instance.currentUser.uid) {
            return Container(
                decoration: BoxDecoration(color: Colors.red),
                width: 250,
                height: 100,
                child: Text(
                  'Adı: ${data['userId']}' + ' ${data['soyadi']}',
                  style: TextStyle(fontSize: 25),
                ),);
          }
        }
        return Text('loading...');
      }),
    );
  }
}
