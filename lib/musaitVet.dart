import 'dart:io';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:cevd_vet/videoArama.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusaitVet extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MusaitVet> {
  int _aktifSayfaNo = 0;
  File? imageURI;
  List? result;
  late String path;
  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: Stack(
          children: [
            MaterialButton(
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoArama()),
                  );
                },
                child: Text('Veterineri Ara'),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ))
          ],
        ),
      ),
    );
  }
}
