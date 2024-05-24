import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeController extends ChangeNotifier {
  VideoPlayerController? controller;
  VideoPlayerController? controller1;
  ChewieController? cController1;
  YoutubePlayerController? youtubePlayerController;
  YoutubePlayerController? youtubePlayerControllerAbout;
  bool youtubeInit=false;
  bool youtubeInitAbout=false;
  ChewieController? cController2;
  bool isPlaying = false;
  bool isPlaying1 = false;
  bool isInitialized = false;
  bool isInitialized1 = false;

  init({required String url}) async {
    await Future.delayed(Duration(milliseconds: 100));
    try{
      youtubeInitAbout=false;
      youtubeInit=false;
      notifyListeners();
      youtubePlayerController??=YoutubePlayerController.fromVideoId(videoId: 'gHS0p84DQyA',
          params: const YoutubePlayerParams(
            showControls: true,
            enableCaption: true,
            enableJavaScript: false,
            pointerEvents: PointerEvents.initial,
            strictRelatedVideos: true,
            // playsInline: true,
          )
      );
      youtubeInit=true;
      notifyListeners();
      youtubePlayerControllerAbout??=YoutubePlayerController.fromVideoId(videoId: 'gHS0p84DQyA',
          params: const YoutubePlayerParams(
            showControls: true,
            enableCaption: true,
            playsInline: true,
          )
      );
      youtubeInitAbout=true;
      notifyListeners();
    }catch(e){
      print(e.toString());
    }
    // controller ??= VideoPlayerController.networkUrl(Uri.parse(url))
    //   ..initialize().then((value) async {
    //     controller!.setLooping(true);
    //     isPlaying = true;
    //     isInitialized = true;
    //     controller!.setVolume(0);
        // controller!.addListener(() {
        //   if(!isPlaying){
        //     controller!.play();
        //     isPlaying=true;
        //     notifyListeners();
        //   }
        // });
      //   cController1 = ChewieController(
      //     videoPlayerController: controller!,
      //     allowFullScreen: true,
      //     autoPlay: true,
      //     looping: true,
      //     allowMuting: true,
      //     showControls: false,
      //   );
      //   cController1!.play();
      //   notifyListeners();
      // });

    // controller1 ??= VideoPlayerController.networkUrl(Uri.parse(
    //     'https://firebasestorage.googleapis.com/v0/b/midwest-20922.appspot.com/o/Robo%20war%20compitition%20%23viral%20%23trending%20%23youtubeshorts%20%23shortvideo%20%23shorts%20%23robotics.mp4?alt=media&token=aa95d9ee-dfba-4372-9018-775eedc884ee'))
    //   ..initialize().then((value) async {
    //     controller1!.setLooping(true);
    //     isPlaying1 = true;
    //     isInitialized1 = true;
    //     controller1!.setVolume(0);
    //     // controller1!.addListener(() {
    //     //   if(!isPlaying1){
    //     //     controller1!.play();
    //     //     isPlaying1=true;
    //     //     notifyListeners();
    //     //   }
    //     // });
    //     cController2 = ChewieController(
    //       videoPlayerController: controller1!,
    //       allowFullScreen: true,
    //       autoPlay: true,
    //       looping: true,
    //       allowMuting: true,
    //       showControls: false,
    //     );
    //     cController2!.play();
    //     notifyListeners();
    //   });
  }

  pauseVideo() async {
    if (isPlaying) {
      await controller!.pause();
      isPlaying = false;
      notifyListeners();
    } else {
      await controller!.play();
      isPlaying = true;
      notifyListeners();
    }
  }
}
