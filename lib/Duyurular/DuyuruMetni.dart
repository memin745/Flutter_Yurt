import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class DuyuruMetniPage extends StatefulWidget {
  final String postValue;
  const DuyuruMetniPage({ Key key ,this.postValue}) : super(key: key);

  @override
  State<DuyuruMetniPage> createState() => _DuyuruMetniPageState();
  
}

class _DuyuruMetniPageState extends State<DuyuruMetniPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }
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
        leading: new IconButton(onPressed: () => Navigator.pushReplacement(
            //Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyurularSayfasiPage()),
        ),
          icon: new Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: LiquidPullToRefresh(
        color: Colors.blue[400],
        height: size.height*0.2,
        backgroundColor: Colors.black26,
        onRefresh: _handleRefresh,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/i4.jpeg"),
              fit: BoxFit.cover,
            ),
        ),
          width: size.width * 1,
          height: size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text("Duyurular",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
              Container(
              margin: EdgeInsets.only(top:size.height *0.02),
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15),image: DecorationImage(
            image: AssetImage(
                'assets/test.png'),
            fit: BoxFit.fill,),
              ),
              width: size.width * 0.60,
              height: size.height *0.30,
            ),
              
                Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15), boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.50),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  )],),
                  width: size.width * 10,
                  height: size.height * 0.40,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(child: Text(widget.postValue,textAlign: TextAlign.center, style:TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),)
                    ],
                  ),
                
                
                ),
              
              
            ],
          ),
          
        ),
      ),
    );
  }
}