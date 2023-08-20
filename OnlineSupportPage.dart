import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OnlineSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Online Support'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to our online support page. Below, you will find informative videos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Tutoriels Vidéo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            VideoTutorialWidget(),
            SizedBox(height: 50),
            VideoTutorialWidget1(),
            SizedBox(height: 20),
            Text('Media Sociaux'),
          ],
        ),
      ),
    );
  }
}

class VideoTutorialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: 'jlVdp6PjGQE', // Replace with actual video ID
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return player;
        },
      ),
    );
  }
}

class VideoTutorialWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: 'yZ6Ji7EuuR4', // Replace with actual video ID
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return player;
        },
      ),
    );
  }
}
