import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/Options/storage_servis.dart';
import 'package:flutter_application_3/skeleton.dart';
import 'package:image_picker/image_picker.dart';

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
class StatusServiceUsers{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("users").snapshots();
    return ref;
  }
}
class StatusServiceIzinler{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Izinler").snapshots();
    return ref;
  }
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Izinler").doc(docId).delete();

    return ref;
  }
  }
  class StatusServiceBasvuru{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("AlinanBasvurular").snapshots();
    return ref;
  }}
class StatusServiceResim {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = '';

  //status eklemek için
  Future<Status> addStatus(String status, XFile pickedFile) async {
    var ref = _firestore.collection("users");

    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));

    var documentRef = await ref.add({'users': status, 'Oda': mediaUrl});

    return Status(id: documentRef.id, status: status, image: mediaUrl);
  }

  //status göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("users").snapshots();

    return ref;
  }

  //status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("users").doc(docId).delete();

    return ref;
  }
}