import 'package:cevd_vet/tarama.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  // ignore: unnecessary_new
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: Anasayfa(),
  ));
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _aktifSayfaNo = 0;
  late PageController sayfaKumandasi;
  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      // ignore: unnecessary_new
      appBar: new AppBar(
        title: const Text('Cat Disease Detection'),
      ),
      body: Stack(children: [
        Container(),
        PageView(
          onPageChanged: (acilanSayfaNo) {
            setState(() {
              _aktifSayfaNo = acilanSayfaNo;
            });
          },
          controller: sayfaKumandasi,
          children: [MyApp()],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifSayfaNo,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: "Cat Scanning"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp), label: "Find Vet")
        ],
        onTap: (secilenSayfaNo) {
          setState(() {
            sayfaKumandasi.jumpToPage(secilenSayfaNo);
          });
        },
      ),
    );
  }
}
