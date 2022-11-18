import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/videos_list.dart';

class VideoPlayer extends StatefulWidget {
  final VideoItem videoItem;

  VideoPlayer({
    required this.videoItem,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoUrl =
        'https://www.youtube.com/watch?v=${widget.videoItem.video.resourceId.videoId}';

    final videoID = YoutubePlayer.convertUrlToId(videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoItem.video.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: const Text('Mesob Hixanat Channel'),
          ),
          body: Column(
            children: [
              player,
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.videoItem.video.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
