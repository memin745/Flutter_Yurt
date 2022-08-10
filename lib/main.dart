import 'package:flutter/material.dart';
import 'package:flutter_application_3/Duyurular/DuyurularSayfasi.dart';
import 'package:flutter_application_3/YurtIslemleri/YurtIslemleri.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/izinbasvuru/izinvebasvuru.dart';
import 'package:flutter_application_3/profil/profilgiris.dart';


void main() async {
  runApp(const MyGrillApp());
}

class MyGrillApp extends StatelessWidget {
  const MyGrillApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/mainlayout': (context) => const MainLayout(),
      },
      initialRoute: '/mainlayout',
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({Key key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();
  final _page5 = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _page1,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => HomePage()
            ),
          ),
          Navigator(
            key: _page2,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => IzinveBasvuruPage()
            ),
          ),
          Navigator(
            key: _page3,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => YurtIslemleriPage()
            ),
          ),
          Navigator(
            key: _page4,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => DuyurularSayfasiPage()
            ),
          ),
          Navigator(
            key: _page5,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) =>ProfilGirisPage()
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
            BottomNavigationBarItem(icon: Icon(Icons.add_to_photos), label: 'İzin-Başvuru'),
            BottomNavigationBarItem(icon: Icon(Icons.apartment), label: 'Yurt İşlemleri'),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Duyurular'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
  
