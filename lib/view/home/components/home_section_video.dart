import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:midwest/view_model/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../res/app_images.dart';

class HomeSectionVideo extends StatefulWidget {
  const HomeSectionVideo({super.key, required this.videoPlayerController});
  final ChewieController videoPlayerController;

  @override
  State<HomeSectionVideo> createState() => _HomeSectionVideoState();
}

class _HomeSectionVideoState extends State<HomeSectionVideo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.videoPlayerController.play();
  }
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Chewie(controller: widget.videoPlayerController,),
          ));
  }
}
