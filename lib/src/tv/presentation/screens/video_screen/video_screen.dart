import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  final String videoKey;

  const VideoScreen({Key? key, required this.videoKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VideoScreenContent(
      videoKey: videoKey,
    );
  }
}

class VideoScreenContent extends StatefulWidget {
  final String videoKey;

  const VideoScreenContent({Key? key, required this.videoKey})
      : super(key: key);

  @override
  State<VideoScreenContent> createState() => _VideoScreenContentState();
}

class _VideoScreenContentState extends State<VideoScreenContent> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoKey,

        flags: YoutubePlayerFlags(autoPlay: false, mute: false));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Scaffold(
              body: youtubeHierarchy(),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: youtubeHierarchy(),
            );
          }
        });
  }

  youtubeHierarchy() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: YoutubePlayer(
          aspectRatio: 4/3,
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
