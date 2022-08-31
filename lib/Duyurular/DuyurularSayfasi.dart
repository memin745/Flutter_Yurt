import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyuruMetni.dart';
import 'package:flutter_application_3/Options/appbarContainer.dart';
import 'package:flutter_application_3/Options/backIconButton.dart';
import 'package:flutter_application_3/Options/backgroundimage.dart';
import 'package:flutter_application_3/Options/baslikContainer.dart';
import 'package:flutter_application_3/Options/duyuruClass.dart';
import 'package:flutter_application_3/Options/status_service.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DuyurularSayfasiPage extends StatefulWidget {
  const DuyurularSayfasiPage({Key key}) : super(key: key);

  @override
  State<DuyurularSayfasiPage> createState() => _DuyurularSayfasiPageState();
}

class _DuyurularSayfasiPageState extends State<DuyurularSayfasiPage> {
  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    background _background = background();
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appbarContainer(),
        title: baslikTitle(),
        automaticallyImplyLeading: false,
        leading: backIconButton(
          page: HomePage(),
        ),
      ),
      body: LiquidPullToRefresh(
        color: Colors.blue[400],
        height: size.height * 0.2,
        backgroundColor: Colors.black26,
        onRefresh: _handleRefresh,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _background.image,
              fit: BoxFit.cover,
            ),
          ),
          child: duyuru(statusService: _statusService, size: size),
        ),
      ),
    );
  }
}

