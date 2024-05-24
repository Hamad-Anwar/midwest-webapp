import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midwest/view/buy_ticket/buy_ticket.dart';
import 'package:midwest/view/home/components/home_section.dart';
import 'package:midwest/view/home/home_page.dart';
import 'package:midwest/view/register_team/register_team.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../res/app_images.dart';
import '../../view_model/controller/home_controller.dart';
import '../drawer/drawer.dart';
import '../home/components/app_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}
late PodPlayerController aboutVideoPlayer;
class _AboutPageState extends State<AboutPage>{

  bool isInit=false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    aboutVideoPlayer = PodPlayerController(
      podPlayerConfig: PodPlayerConfig(
        autoPlay: false,
      ),
      playVideoFrom: PlayVideoFrom.network(
        'https://firebasestorage.googleapis.com/v0/b/midwest-20922.appspot.com/o/video%2FEXPLOSIVE%20MATCH%20IS%20A%20PROPER%20TUG%20OF%20WAR!%20-%20Gigabyte%20vs%20Minotaur%20-%20BattleBots.mp4?alt=media&token=c8b31622-c65d-4743-a9d8-cf8d5ce7f11d',
      ),
    )..initialise().then(
          (value) {
        setState(() {
          isInit=true;
        });
      },
    );
    Timer(Duration(milliseconds: 100), () {
      try{
        homeVideoController.pause();
        aboutVideoPlayer.pause();
      }catch(_){

      }
    },);
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<HomeController>(context,listen: false).init(url: 'https://firebasestorage.googleapis.com/v0/b/midwest-20922.appspot.com/o/video%2FRobot%20Wars-%20Episode%205%20Battle%20Recaps%202017%20-%20BBC%20Two_2.mp4?alt=media&token=871c30f4-5f72-4514-965d-20ac1bdc3e53');
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width, maxHeight: MediaQuery.sizeOf(context).height),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/bg.png',fit: BoxFit.cover,),
                  Container(
                    color: Colors.black87,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const TopAppBar(),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width>600?
                           100 : 20,
                        ),
                        Row(
                          children: [
                            SizedBox(width:MediaQuery.sizeOf(context).width>600 ? 100 :20,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (MediaQuery.sizeOf(context).width <= 1190)
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Consumer<HomeController>(
                                          builder: (context, value, child) {
                                            return isInit
                                                ? SizedBox(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child:  PodVideoPlayer(
                                                controller: aboutVideoPlayer,
                                              ),
                                                // child: YoutubePlayer(
                                                //     aspectRatio: 16/9,
                                                //     controller:
                                                //     value.youtubePlayerControllerAbout!),
                                              ),
                                            )
                                                : SizedBox();
                                          },
                                        )),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    'Unleash Chaos in\nthe Arena: Customize\nCommand Conquer in RoboWar!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        MediaQuery.sizeOf(context).width > 1130
                                            ? 34
                                            : 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 450,
                                    child: Text(
                                      'Experience adrenaline-pumping action as you engage in intense battles against players from around the globe. Are you ready to prove your dominance? Immerse yourself in stunning graphics and dynamic gameplay that will transport you into a futuristic world where only the strongest survive.',
                                      style: TextStyle(color: Colors.grey,
                                      fontFamily: ''
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTeam(),)),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context).width>600?50:40,
                                              width: MediaQuery.sizeOf(context).width>600?250:180,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          AppImages.buttonBg),
                                                      fit: BoxFit.fill)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Register Team',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: '',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery.sizeOf(context).width>600?
                                                    15  : 12),
                                              ),
                                            ),
                                          ),
                                          if (MediaQuery.sizeOf(context).width >
                                              650)
                                            SizedBox(
                                              width: 30,
                                            ),
                                          if (MediaQuery.sizeOf(context).width >
                                              650)
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket(),));
                                              },
                                              child: Container(
                                                height: MediaQuery.sizeOf(context).width>600?50:40,
                                                width: MediaQuery.sizeOf(context).width>600?
                                                200 : 140,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            AppImages.buttonBg),
                                                        fit: BoxFit.fill)),
                                                alignment: Alignment.center,
                                                child:  Text(
                                                  'Buy Ticket',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: '',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: MediaQuery.sizeOf(context).width>600?
                                                      15  : 12),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (MediaQuery.sizeOf(context).width <= 650)
                                        SizedBox(
                                          height: 20,
                                        ),
                                      if (MediaQuery.sizeOf(context).width <= 650)
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket(),));

                                          },
                                          child: Container(
                                            height: MediaQuery.sizeOf(context).width>600?50:40,
                                            width:MediaQuery.sizeOf(context).width>600?
                                            200 : 140,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.buttonBg),
                                                    fit: BoxFit.fill)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Buy Ticket',
                                              style: TextStyle(
                                                fontFamily: '',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.sizeOf(context).width>600?
                                                  15  : 12),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            if (MediaQuery.sizeOf(context).width > 1190)
                              Expanded(
                                  child:  Consumer<HomeController>(
                                    builder: (context, value, child) {
                                      return value.youtubeInitAbout
                                          ? SizedBox(
                                        height: MediaQuery.sizeOf(context).height - 400,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child:  PodVideoPlayer(
                                          controller: aboutVideoPlayer,
                                        ),
                                          // child: YoutubePlayer(
                                          //     aspectRatio: 16/9,
                                          //     controller:
                                          //     value.youtubePlayerControllerAbout!),
                                        ),
                                      )
                                          : SizedBox();
                                    },
                                  ),),
                         MediaQuery.sizeOf(context).width>600 ?  SizedBox(width: 100,) : SizedBox(width: 20,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
