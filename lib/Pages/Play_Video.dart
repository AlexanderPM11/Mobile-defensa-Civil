import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  String videoId;
  PlayVideo({required this.videoId, Key? key}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState(videoId: this.videoId);
}

class _PlayVideoState extends State<PlayVideo> {
  late YoutubePlayerController _controller;
  String videoId;
  _PlayVideoState({required this.videoId});
  bool loading = false;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  String title = "";

  void playVideo() {
    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(autoPlay: false, enableCaption: true))
      ..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  @override
  void initState() {
    super.initState();
    playVideo();
  }

  void listener() {
    if (_isPlayerReady) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Reproducción")),
        body: Scrollbar(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            color: Color.fromARGB(255, 28, 27, 26),
            margin: EdgeInsets.all(10),
            child: Card(
                margin: const EdgeInsets.all(20),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    SizedBox(
                        height: 320,
                        width: double.infinity,
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.blueAccent,
                            onReady: () {
                              _isPlayerReady = true;
                              print(_controller);
                              setState(() {
                                title = _controller.metadata.title;
                              });
                            },
                          ),
                          builder: (context, player) => ListView(
                            children: [
                              player,
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  _controller.metadata.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                )),
          )
        ])));
  }
}
