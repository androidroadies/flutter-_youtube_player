import 'package:flutter/material.dart';
import 'package:youtube_demo/Model/VideoModel.dart';
import 'package:youtube_demo/Screens/VideoScreen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {

  List<VideoModel> list = [
    VideoModel("BigBuckBunny", "images/BigBuckBunny.jpg",
        "https://www.youtube.com/watch?v=feQhHStBVLE"),
    VideoModel(
      "ElephantsDream",
      "images/ElephantsDream.jpg",
      "https://www.youtube.com/watch?v=qkkO4Fzkd-Q",
    ),
    VideoModel("Elephant Dream", "images/ForBiggerBlazes.jpg",
        "https://www.youtube.com/watch?v=Q3oItpVa9fs"),
    VideoModel("For Bigger Escape", "images/ForBiggerEscapes.jpg",
        "https://www.youtube.com/watch?v=-SjoZIkYnbQ"),
    VideoModel("For Bigger Fun", "images/ForBiggerFun.jpg",
        "https://www.youtube.com/watch?v=NeQzY6_Eqxk"),
    VideoModel("For Bigger Joyrides", "images/ForBiggerJoyrides.jpg",
        "https://www.youtube.com/watch?v=TpLhLBhFTag"),
    VideoModel("For Bigger Meltdowns", "images/ForBiggerMeltdowns.jpg",
        "https://youtu.be/oW-txzEu6rg"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return createList();
  }

  createList() {
    return ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoScreen(
                            videoUrl: list[index].videoUrl,
                          )));
            },
            child: Card(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 300,
                child: youTubePlayer(index),
              ),
            ),
          );
        });
  }

  youTubePlayer(int index) {
    return YoutubePlayerBuilder(
        player: player(index),
        builder: (context, player) {
          return ListView(
            children: [player],
          );
        });
  }

  player(int index) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: getVideoId(list[index].videoUrl), //Add videoID.

        flags: YoutubePlayerFlags(
          hideControls: true,
          controlsVisibleAtStart: true,
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blue,
    );
  }
}
