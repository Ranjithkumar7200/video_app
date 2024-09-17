// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:video_app/video_player_screen.dart';

class VideoFeed extends StatelessWidget {
  final List<Video> videos = [
    // Sample videos (replace with actual video paths)
    Video(
        username: 'User1',
        likes: 120,
        thumbnail: 'assets/codes.jpg',
        videoUrl: 'assets/video.mp4'),
    Video(
        username: 'User2',
        likes: 250,
        thumbnail: 'assets/thumb.jpg',
        videoUrl: 'assets/short.mp4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Video Feed')),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return GestureDetector(
            onTap: () {
              // Navigate to VideoPlayerScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(video: video)),
              );
            },
            child: Card(
              child: Column(
                children: [
                  // Thumbnail image (to be optimized later)
                  Image.asset(video.thumbnail),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(video.username),
                        Text('${video.likes} likes'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Define the Video class
class Video {
  final String username;
  final int likes;
  final String thumbnail;
  final String videoUrl;

  Video({
    required this.username,
    required this.likes,
    required this.thumbnail,
    required this.videoUrl,
  });
}
