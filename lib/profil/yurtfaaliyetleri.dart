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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width * 1,
        height: size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yurt Faaliyetleri",style: TextStyle(fontSize: 20,color: Colors.white),
              
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
              child: Text(title,style: TextStyle(fontSize: 20,color: Colors.black)
   ), 
              ), 
              
            );
  
}