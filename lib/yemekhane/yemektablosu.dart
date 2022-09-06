import 'package:flutter/material.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/storage_servis.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/yemekhane/yememkhanesayfa.dart';

class YemekTablosuPage extends StatefulWidget {
  const YemekTablosuPage({Key key}) : super(key: key);

  @override
  State<YemekTablosuPage> createState() => _YemekTablosuPageState();
}

class _YemekTablosuPageState extends State<YemekTablosuPage> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    background _background = background();
    int _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        title: baslikTitle(),
        automaticallyImplyLeading: false,
        leading: backIconButton(
          page: YemekhanePage(),
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
        child: Column(children: [
          FutureBuilder(
                future: storage.downloadURL("test.png"),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Container(
                        width: size.width*1,
                        height: size.height*0.8,
                        child: Image.network(
                          snapshot.data,
                          fit: BoxFit.cover,
                        ));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return Container();
                },
              )
        ]),
        
      ),
    );
  }
}
