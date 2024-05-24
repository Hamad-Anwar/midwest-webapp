import 'package:video_player/video_player.dart';

class VideoServices{
  VideoPlayerController? controller;
  bool isSet=false;
  bool isPlaying=false;
  initializeController({required String url})async{
    controller=VideoPlayerController.networkUrl(Uri.parse(url))..initialize().then((value){
      isSet=true;
      isPlaying=true;
      controller!.play();
    });
  }

  playPause()async{
    if(isPlaying){
      controller!.pause();
    }else{
      controller?.pause();
      isPlaying=false;
    }
  }



}