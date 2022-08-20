import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/homepage.dart';


class UserManagement {
  storeNewUser(user, context) async {
    FirebaseAuth firebaseUser = FirebaseAuth.instance;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.currentUser.uid)
        .set({'adi': user.email, 'userId': user.uid})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())))
        .catchError((e) {
          print(e);
        });
  }
}