import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/youtube_player_widget.dart';

class VideoShowPage extends StatefulWidget {
  final String url;

  VideoShowPage({required this.url});

  @override
  _VideoShowPageState createState() => _VideoShowPageState();
}

class _VideoShowPageState extends State<VideoShowPage> {
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    // Disable the status bar.
    //SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    // Restore the previous state of the system overlays.
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Determine the screen size and aspect ratio based on orientation.
          Size screenSize = MediaQuery.of(context).size;
          double aspectRatio = screenSize.width / screenSize.height;
          if (orientation == Orientation.landscape) {
            // If the device is in landscape orientation, set full-screen mode.
            _isFullScreen = true;
          } else {
            // Otherwise, set normal mode.
            _isFullScreen = false;
          }
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Container(
                  //height: screenSize.width / 2,
                  child: YoutubePlayerWidget(
                    videoUrl: widget.url,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
