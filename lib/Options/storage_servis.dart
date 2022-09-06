import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

//resim eklemek için
  Future<String> uploadMedia(File file) async {
    var uploadTask = _firebaseStorage
        .ref()
        .child(
            "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}")
        .putFile(file);

    uploadTask.snapshotEvents.listen((event) {});

    var storageRef = await uploadTask;

    return await storageRef.ref.getDownloadURL();
  }
}
class Storage{
  final firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String filePath,
    String fileName,
  )async{
    File file = File(filePath);
    try {
      await storage.ref('test/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch(e){
      print(e);
    }
  }
  Future<firebase_storage.ListResult> listFiles()async{
    firebase_storage.ListResult results =await storage.ref('test').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Bulunamadı:$ref');
     });
     return results;
  }

  Future<String> downloadURL(String imageName) async{
    String downloadURL = await storage.ref('test/$imageName').getDownloadURL();
    return downloadURL;
  }
}