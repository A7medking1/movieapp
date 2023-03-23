import 'package:flutter/material.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/movie/domain/entity/videos.dart';
import 'package:movieapp/src/tv/presentation/screens/video_screen/video_screen.dart';

import '../../../../movie/presentation/widget/cached_image_widget.dart';

String thumbnailImages(String key) => 'https://img.youtube.com/vi/$key/0.jpg';

class TrailersScreen extends StatelessWidget {
  final List<Videos> videos;

  const TrailersScreen({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 200,
                      child: CachedImages(
                        imageUrl: thumbnailImages(
                          videos[index].key,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          navigateTo(
                              context: context,
                              page: VideoScreen(videoKey: videos[index].key));
                        },
                        icon: Icon(
                          Icons.play_circle_fill_rounded,
                          size: 40,
                        ))
                  ],
                )
              ],
            ),
          );
        },
        itemCount: videos.length,
      ),
    );
  }
}
