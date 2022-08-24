import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Duyurular").snapshots();
    return ref;
  }
}
class StatusServicebasvurular{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Basvurular").snapshots();
    return ref;
  }
}