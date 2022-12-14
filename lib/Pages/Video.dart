import 'package:flutter/material.dart';
import 'package:project_final/Pages/main_Drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart';

import '../Models/Video.dart';
import '../Services/Video_Api .dart';
import '../widget/Card/Card_general.dart';
import 'Play_Video.dart';

class Video extends StatefulWidget {
  const Video({super.key});
  static String routeName = "/video";
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  String imgUrl = './assets/you_Player.png';

  Future<List<Video_Model>>? listViedwo;

  @override
  void initState() {
    setState(() {
      listViedwo = Video_Api.GetVideo();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawe(),
        appBar: AppBar(title: const Text("Videos")),
        body: FutureBuilder<List<Video_Model>>(
            future: listViedwo,
            builder: (context, snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                List<Widget> list = [];
                for (Video_Model item in snapshot.data ?? []) {
                  list.add(GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlayVideo(videoId: item.link)));
                    },
                    child: Card_General(imgUrl, item.Titulo, item.Descripcion,
                        isLocalImage: true, width: 150, height: 100),
                  ));
                }
                return ListView(shrinkWrap: true, children: list);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
