import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';


class YurtArizaPage extends StatefulWidget {
  const YurtArizaPage({ Key key }) : super(key: key);

  @override
  State<YurtArizaPage> createState() => _YurtArizaPageState();
}

class _YurtArizaPageState extends State<YurtArizaPage> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController katController = TextEditingController();
  TextEditingController sorunController = TextEditingController();
  String email;
  @override
  Widget build(BuildContext context) {
     CollectionReference arizaRef = _firestore.collection('Ariza');
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
              Colors.black26,
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
            MaterialPageRoute(builder: (context) => YurtIslemleriPage()),
          ),
          icon: new Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: size.width * 0.02),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/i4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: size.width * 0.02),
              margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
              decoration: BoxDecoration(
                  color: Color(
                    0xFFeeeee0,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.65,
              height: size.height * 0.08,
              child: TextField(
                controller: katController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Kat Giriniz',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.02),
              margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
              decoration: BoxDecoration(
                  color: Color(
                    0xFFeeeee0,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.65,
              height: size.height * 0.25,
              child: TextField(
                controller: sorunController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Sorun Giriniz',
                  
                ),
              ),
            ),
           
                Container(
              padding: EdgeInsets.only(left: size.width * 0.02),
              margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
              decoration: BoxDecoration(
                  color: Color(0xFFff0000
                
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.25,
              height: size.height * 0.08,
              child:  TextButton(onPressed:() async{

                print(katController.text);
                print(sorunController.text);


                Map<String, String> movieData = {

            'name': katController.text,
            'duyuru': sorunController.text,

              };
              String kat=katController.text;
              String sorun=sorunController.text;
              
              await arizaRef.doc().set({'Email':FirebaseAuth.instance.currentUser.email,'Kat' : '$kat','Sorun':'$sorun','Tarih':DateTime.now(),'Ariza Durumu':false},katController.text = null);
              Fluttertoast.showToast(msg: "Arıza Gönderildi",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             timeInSecForIosWeb: 5,
             backgroundColor: Colors.amber,
             textColor: Colors.white,
             fontSize: 15);
             Navigator.pushReplacement(
              //Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YurtArizaPage()));
              },
            
              
                  child: Text(
                    "Bildir",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
            ),
          ],
        )));
      
    
  }
}
