import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoId;
  final Duration startAt;
  final Duration endAt;

  const CustomVideoPlayer(
      {super.key,
      required this.videoId,
      required this.startAt,
      required this.endAt});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController controller;

// new version is giving some errors thats why i am suing old verions, you can also try new version
  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: YoutubePlayerParams(
        showControls: true,
        mute: false,
        startAt: widget.startAt,
        endAt: widget.endAt,
        autoPlay: false,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
        loop: false,
        showFullscreenButton: true,
        enableKeyboard: false,
      ),
    );

    controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    };
    controller.onExitFullscreen = () {};
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.close();
    super.dispose();
  }

  var aspectRatio = 16 / 9;

  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      controller: controller,
      builder: (context, value) {
        return AnimatedCrossFade(
          firstChild: SizedBox(
            height: ScreenUtil().setHeight(100),
            width: double.maxFinite,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          secondChild: AspectRatio(
            aspectRatio: aspectRatio,
            child: ytFrame(controller),
          ),
          crossFadeState: value.isReady
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 500),
        );
      },
    );
  }

  Widget ytFrame(YoutubePlayerController controller) {
    return YoutubePlayerIFrame(
      controller: controller,
    );
  }
}
