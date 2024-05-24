import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midwest/view/home/components/home_section_video.dart';
import 'package:midwest/view_model/controller/home_controller.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../res/app_images.dart';
import '../../buy_ticket/buy_ticket.dart';
import 'app_bar.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}
late PodPlayerController homeVideoController;
class _HomeSectionState extends State<HomeSection> with RouteAware{

  bool isInit=false;
  @override
  void initState() {
    super.initState();
      homeVideoController = PodPlayerController(
        podPlayerConfig: PodPlayerConfig(
          autoPlay: false,
        ),
        playVideoFrom: PlayVideoFrom.network(
            'https://firebasestorage.googleapis.com/v0/b/midwest-20922.appspot.com/o/video%2FEXPLOSIVE%20MATCH%20IS%20A%20PROPER%20TUG%20OF%20WAR!%20-%20Gigabyte%20vs%20Minotaur%20-%20BattleBots.mp4?alt=media&token=c8b31622-c65d-4743-a9d8-cf8d5ce7f11d',
            videoPlayerOptions: VideoPlayerOptions(

            )
        ),
      )..initialise().then(
            (value) {
          setState(() {
            isInit=true;
            Timer(Duration(seconds: 1), () => homeVideoController.play(),);
          });
        },
      );
    }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteObserver().subscribe(this, ModalRoute.of(context)!);
  }
  @override
  void didPushNext() {
    homeVideoController.pause();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: false);
    var size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Container(
        height: MediaQuery.sizeOf(context).width<600 && MediaQuery.sizeOf(context).height>500? 500 : MediaQuery.sizeOf(context).height - (MediaQuery.sizeOf(context).width>600 && MediaQuery.sizeOf(context).height<=800? 0 : 150) ,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width > 600 ? 0 : 0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.02),
            border: Border(
                // bottom: BorderSide(color: Colors.white12,width: 2),

                )),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Container(
            //   child: MediaQuery.sizeOf(context).width>600? Container(
            //     child: Consumer<HomeController>(
            //       builder: (context, value, child) {
            //         if(!value.isInitialized){
            //           return Center(
            //             child: Padding(
            //               padding:  EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width>600 ?50:0),
            //               child: Image.asset(AppImages.rogoWar,
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           );
            //         }
            //         return  HomeSectionVideo(videoPlayerController: value.cController1!);
            //       },
            //     ),
            //   ) :Consumer<HomeController>(
            //     builder: (context, value, child) {
            //       if(!value.isInitialized1){
            //         return Center(
            //           child: Padding(
            //             padding:  EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width>600 ?50:0),
            //             child: Image.asset(AppImages.rogoWar,
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         );
            //       }
            //       return Container(
            //         padding: EdgeInsets.only(bottom: 100,),
            //         width: MediaQuery.sizeOf(context).width,
            //         child: FittedBox(
            //           fit: BoxFit.fitWidth,
            //           alignment: Alignment.center,
            //           child: Padding(
            //             padding: const EdgeInsets.only(bottom: 50),
            //             child: HomeSectionVideo(videoPlayerController: value.cController2!),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            Positioned.fill(
                child: Column(
              mainAxisAlignment:MediaQuery.sizeOf(context).width <= 1130?MainAxisAlignment.start: MainAxisAlignment.center,
              crossAxisAlignment: MediaQuery.sizeOf(context).width <= 1130?CrossAxisAlignment.start: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                if (MediaQuery.sizeOf(context).width <= 1130)
                  Scaffold.of(context).isDrawerOpen
                      ? SizedBox()
                      : Consumer<HomeController>(
                          builder: (context, value, child) {
                            return isInit
                                ? Container(
                                    height: MediaQuery.sizeOf(context).width >
                                            1130
                                        ? MediaQuery.sizeOf(context).height - 200
                                        : MediaQuery.sizeOf(context).width >600? 400 : 200,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: PodVideoPlayer(

                                          controller: homeVideoController,
                                        ),
                                        // child: YoutubePlayer(
                                        //     aspectRatio: 16 / 9,
                                        //     controller:
                                        //         controller.youtubePlayerController!),
                                      ),
                                    ),
                                  )
                                : Container(
                              height: MediaQuery.sizeOf(context).width >
                                1130
                                ? MediaQuery.sizeOf(context).height - 200
                                : MediaQuery.sizeOf(context).width >600? 400 : 250,
                              width: double.infinity,
                              color: Colors.black,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              ),
                            );
                          },
                        ),
                if (MediaQuery.sizeOf(context).width <= 1130)
                  SizedBox(
                    height: 20,
                  ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Align(
                            alignment: MediaQuery.sizeOf(context).width>600? Alignment.center : Alignment.topLeft,
                        child: SizedBox(
                          width: 400,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Witness \nUltimate Bot\nShowdown RoboWar!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.sizeOf(context).width > 1130
                                                ? 34
                                                : 17),
                                  ),
                                ),
                                const Text(
                                  'Experience adrenaline-pumping action as you engage in intense battles against players from around the globe. Are you ready to prove your dominance?',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontFamily: ''),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                      if (MediaQuery.sizeOf(context).width > 1130)
                        Expanded(
                          child: Consumer<HomeController>(
                            builder: (context, value, child) {
                              return isInit
                                  ? SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height - 400,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: PodVideoPlayer(
                                          matchFrameAspectRatioToVideo: false,
                                          matchVideoAspectRatioToFrame: false,
                                          controller: homeVideoController,
                                        ),
                                        // child: YoutubePlayer(
                                        //     aspectRatio: 1,
                                        //     controller: controller
                                        //         .youtubePlayerController!),
                                      ),
                                    )
                                  :  Container(
                                height: MediaQuery.sizeOf(context).height - 400,
                                width: double.infinity,
                                color: Colors.black,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      MediaQuery.sizeOf(context).width > 1130
                          ? SizedBox(
                              width: 100,
                            )
                          : SizedBox(
                              width: 20,
                            )
                    ],
                  ),
                ),
              ],
            )),
            Positioned(
              bottom: 0,
              left: 1,
              right: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  size.width > 856
                      ? Image.asset(AppImages.leftRec)
                      : Expanded(child: Image.asset(AppImages.leftRec)),
                  size.width > 856
                      ? Image.asset(AppImages.rightRec)
                      : Expanded(child: Image.asset(AppImages.rightRec))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyTicket(),
                      )),
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              AppImages.buttonBg,
                            ))),
                    alignment: Alignment.center,
                    child: Text(
                      'Book Ticket',
                      style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         // Image.asset(AppImages.midWest1,height: 50,),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Text(
            //           'ROBOWAR',
            //           style: TextStyle(
            //               color: Colors.red,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 25),
            //         ),
            //         // Text('NORTH AMERICA\'S',style: TextStyle(
            //         //     color: Colors.red,
            //         //     fontWeight: FontWeight.bold,
            //         //     fontSize: 25
            //         // ),),
            //         // SizedBox(height: 10,),
            //         // Text('TOP TIER PLAYSTATION\nF1 LEAGUE',
            //         //   textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //         //       color: Colors.white,
            //         //       wordSpacing: 2,
            //         //       fontWeight: FontWeight.bold,
            //         //       fontSize: 22
            //         //   ),),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Center(
            //           child: Container(
            //             child: InkWell(
            //               onTap: () => Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => BuyTicket(),
            //                   )),
            //               child: Container(
            //                 height: 40,
            //                 width: 200,
            //                 decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                         image: AssetImage(
            //                   AppImages.buttonBg,
            //                 ))),
            //                 alignment: Alignment.center,
            //                 child: Text(
            //                   'Book Ticket',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 15),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 70,
                color: Colors.black,
                child: Column(
                  children: [
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const TopAppBar(),
                  ],
                ),
              ),
            )
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child:  Padding(
            //     padding: const EdgeInsets.only(bottom: 60),
            //     child: InkWell(borderRadius: BorderRadius.circular(100),
            //       onTap: () {
            //         controller.pauseVideo();
            //       },
            //       child: CircleAvatar(
            //         backgroundColor: Colors.red,
            //         child: Center(child: Consumer<HomeController>(
            //           builder: (context, value, child) {
            //             if(controller.isPlaying){
            //               return Icon(Icons.pause,color: Colors.black,size: 27,);
            //             }
            //             return Icon(Icons.play_arrow_rounded,color: Colors.black,size: 27,);
            //           },
            //         )),
            //       ),
            //     ),
            //   ),)
          ],
        ),
      ),
    );
  }
}
