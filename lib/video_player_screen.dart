// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_feed.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Video video;

  VideoPlayerScreen({required this.video});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      }).catchError((error) {
        // ignore: avoid_print
        print('Video player error: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : CircularProgressIndicator(),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    icon: Icon(_controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 40,
                  ),
                  color: _isLiked ? Colors.red : Colors.white,
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    '${_isLiked ? widget.video.likes + 1 : widget.video.likes} likes',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          VideoProgressIndicator(_controller, allowScrubbing: true),
        ],
      ),
    );
  }
}
