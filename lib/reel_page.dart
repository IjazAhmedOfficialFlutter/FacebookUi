import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSliderPage extends StatefulWidget {
  const VideoSliderPage({super.key});

  @override
  _VideoSliderPageState createState() => _VideoSliderPageState();
}

class _VideoSliderPageState extends State<VideoSliderPage> {
  List<String> videoIds = [
    'nPt8bK2gbaU',
    'F1B9Fk_SgI0',
    'q7wD_qpOU0k',
  ];

  late PageController _pageController;
  late List<YoutubePlayerController> _youtubeControllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _youtubeControllers = videoIds
        .map((id) => YoutubePlayerController(
              initialVideoId: id,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ))
        .toList();
    _youtubeControllers.first.play(); // Start playing the first video
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _youtubeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playVideo(int index) {
    for (int i = 0; i < _youtubeControllers.length; i++) {
      if (i == index) {
        _youtubeControllers[i].play();
      } else {
        _youtubeControllers[i].pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoIds.length,
        onPageChanged: _playVideo,
        itemBuilder: (context, index) {
          return YoutubePlayerWidget(controller: _youtubeControllers[index]);
        },
      ),
    );
  }
}

class YoutubePlayerWidget extends StatelessWidget {
  final YoutubePlayerController controller;

  const YoutubePlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );
  }
}
