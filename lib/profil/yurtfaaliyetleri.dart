import 'package:flutter/material.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';

class YurtFaaliyetleriPage extends StatefulWidget {
  const YurtFaaliyetleriPage({ Key key }) : super(key: key);

  @override
  State<YurtFaaliyetleriPage> createState() => _YurtFaaliyetleriPageState();
}

class _YurtFaaliyetleriPageState extends State<YurtFaaliyetleriPage> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Şehit Furkan Doğan Yurdu"),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilGirisPage()),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.width * 0.06),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
        width: size.width * 0.85,
        height: size.height * 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yurt Faaliyetleri",style: TextStyle(fontSize: 20),
              
              ),
            ),
            Expanded( 
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
                Padding(
                padding: const EdgeInsets.all(8),
                child:YurtFaaliyetleri("Faaliyet",context),
                ),
              ],
            )
          )

          ],
        ),
      ),
    );
  }
}
Widget YurtFaaliyetleri(String title , context){
  Size size = MediaQuery.of(context).size;
  return Container(
    
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
              width: 200,
              height: 50,
              child: TextButton(onPressed: () => {}, 
              child: Text(title,style: TextStyle(fontSize: 20)
   ), 
              ), 
              
            );
  
}