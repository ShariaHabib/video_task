import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay(
      {super.key, required this.videoLink, required this.thumbnail});

  final String videoLink;
  final String thumbnail;

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool isThumbnailVisible = true;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
      widget.videoLink,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        setState(() {});
      });
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: true,
        allowFullScreen: true,
        draggableProgressBar: true,
        showControls: true);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  void thumbLine() {
    setState(() {
      isThumbnailVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!videoPlayerController.value.isInitialized)
          Column(
            children: [
              // SizedBox(height: 40),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.thumbnail,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        if (videoPlayerController.value.isInitialized)
          Column(
            children: [
              AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: Chewie(controller: chewieController),
              ),
            ],
          ),
        // if (isThumbnailVisible)
        //   IconButton(
        //     icon: Icon(
        //       Icons.play_circle_fill,
        //       size: 50.0,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         isThumbnailVisible = false;
        //         chewieController.play();
        //       });
        //     },
        //   ),
        Positioned(
            top: 35,
            child: IconButton(
                onPressed: () {
                  print("PRESSED");
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back)))
      ],
    );
  }
}
