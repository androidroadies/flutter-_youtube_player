import 'package:flutter/material.dart';
import 'package:youtube_demo/Screens/VideoList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: VideoList(),
        )
    );
  }
}
