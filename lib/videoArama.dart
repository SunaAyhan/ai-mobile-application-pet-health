import 'dart:io';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoArama extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<VideoArama> {
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      tempToken:
          "006f56c221d18184f919d30fe87a96d33a5IACzwSIqnlu7k+ALeEd+oZzxKt+UYZvRJab1D+i5b1XJijfn3+AAAAAAEACVNqlcIovJYQEAAQAni8lh",
      appId: "f56c221d18184f919d30fe87a96d33a5",
      channelName: "vet",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );
  int _aktifSayfaNo = 0;
  File? imageURI;
  List? result;
  late String path;
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}
