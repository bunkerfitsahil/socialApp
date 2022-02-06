import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:social_feed_flutter/constants/colors.dart';
import 'package:video_player/video_player.dart';

import '../main.dart';

// String? url;
// VideoView({this.url});
class VideoView extends StatefulWidget {
  String? url;
  VideoView({this.url});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url!)
      ..initialize().then((_) {
        // _controller!.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return WebView(
    //     initialUrl: widget.url,
    //     onPageStarted: (url) {
    //       SpinKitCircle();
    //     },
    //     gestureNavigationEnabled: false,
    //     zoomEnabled: true,
    //     javascriptMode: JavascriptMode.unrestricted);
    return _controller!.value.isInitialized
        ? InkWell(
            onTap: () {
              _controller!.play();
            },
            child: VideoPlayer(_controller!),
          )
        : Center(
            child: SpinKitCircle(
              color: AppColors.greenColor,
            ),
          );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String? url;
  final VideoPlayerController videoPlayerController;

  VideoPlayerItem({this.url, required this.videoPlayerController});

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> with RouteAware {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url!);
    _videoPlayerController!.initialize().then((_) {
      if (mounted) {
        setState(() {});
        // _videoPlayerController!.play();
      }
    });
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute); //Subscribe it here
    super.didChangeDependencies();
  }

  /// Called when the current route has been popped off.
  @override
  void didPop() {
    print("didPop");
    _videoPlayerController!.pause();

    super.didPop();
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @override
  void didPopNext() {
    print("didPopNext");
    _videoPlayerController!.pause();
    super.didPopNext();
  }

  /// Called when the current route has been pushed.
  @override
  void didPush() {
    print("didPush");
    _videoPlayerController!.pause();

    super.didPush();
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @override
  void didPushNext() {
    print("didPushNext");
    _videoPlayerController!.pause();
    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController?.value.isInitialized ?? false
        ? Stack(
            children: [
              VideoPlayer(_videoPlayerController!),
              InkWell(
                onTap: () {
                  if (_videoPlayerController!.value.isPlaying) {
                    _videoPlayerController!.pause();
                  } else {
                    _videoPlayerController!.play();
                  }
                  setState(() {});
                },
                child: Center(
                  child: Icon(_videoPlayerController!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              ),
            ],
          )
        : SpinKitCircle(
            color: AppColors.greenColor,
          );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this); //Don't forget to unsubscribe it!!!!!!
    super.dispose();
    _videoPlayerController!.dispose();
  }
}

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}
