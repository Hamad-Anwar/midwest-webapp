import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midwest/res/app_images.dart';
import 'package:midwest/view/botton_nav_bar/bottom_nav_bar.dart';
import 'package:midwest/view/home/home_page.dart';
import 'package:midwest/view/robowar/components/robowar_text.dart';
import 'package:midwest/view_model/controller/robowar_controller.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../about/about.dart';
import '../drawer/drawer.dart';
import '../home/components/app_bar.dart';
import '../home/components/home_section.dart';

class RoboWar extends StatefulWidget {
  RoboWar({super.key});

  @override
  State<RoboWar> createState() => _RoboWarState();
}

class _RoboWarState extends State<RoboWar> {
  final ScrollController scrollController=ScrollController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      try{
        homeVideoController.pause();
        aboutVideoPlayer.pause();
      }catch(_){

      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RoboWarController>(context, listen: false);
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.black,
      body: Center(child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width, maxHeight: MediaQuery.sizeOf(context).height),
              alignment: Alignment.topCenter,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/bg.png',fit: BoxFit.cover,),
                  Container(
                    color: Colors.black87,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TopAppBar(),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: RawScrollbar(
                          controller: scrollController,
                          thumbColor: Colors.white70,
                          thickness: 10,
                          trackColor: Colors.white60,
                          trackVisibility: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20,),
                              Expanded(
                                  flex: 3,
                                  child: SingleChildScrollView(
                                    controller: scrollController,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const RoboWarText(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Consumer<RoboWarController>(
                                              builder: (context, value, child) {
                                                return AnimatedContainer(
                                                  width: double.infinity,
                                                  height: controller.containerOne ? 300 : 50,
                                                  duration: const Duration(milliseconds: 100),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () =>
                                                            controller.openContainer1(),
                                                        child: Container(
                                                          height: 50,
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(5),
                                                              color: Colors.red),
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 20),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'How to get on robowar',
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                fontFamily: ''
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              controller.containerOne? const Icon(
                                                                Icons.remove,
                                                                color: Colors.white,
                                                              ): const Icon(
                                                                Icons.add,
                                                                color: Colors.white,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Expanded(child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'A match is played One-on-One. Refer to the rules in Rulebook.',
                                                              style: TextStyle(color: Colors.white,
                                                              fontFamily: ''
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'Construct a team of a minimum of 2 and a maximum of 10 members. Any institution (School/College/University/Vocational Institution) or group of students (within defined age), may form a team.',
                                                                    style: TextStyle(
                                                                        fontFamily: ''
                                                                      ,
                                                                        color: Colors.white),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'Register the team for the specified competition online on the official technician website only.',
                                                                    style: TextStyle(
                                                                        fontFamily: ''
                                                                      ,
                                                                        color: Colors.white),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'The team has to build a Wireless Bot.',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontFamily: ''

                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'Prepare a video of 1 minute to 5 minutes (maximum 100 MB), showcasing team readiness, creativity, preparing for challenges, or anything to show passion to participate in TechnoXian. Share the video either on email at videosubmission@technoxian.org   (as google drive or V transfer) or WhatsApp at +91 8924934336 mentioning Your Team Registration ID. All videos will be uploaded on TechnoXian YouTube channel. The top 5 Maximum views will have special recognition at the tournament.',
                                                                    style: TextStyle(
                                                                        fontFamily: ''
                                                                      ,
                                                                        color: Colors.white),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Consumer<RoboWarController>(
                                              builder: (context, value, child) {
                                                return AnimatedContainer(
                                                  width: double.infinity,
                                                  height: controller.containerTwo ? 350 : 50,
                                                  duration: const Duration(milliseconds: 100),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () =>
                                                            controller.openContainer2(),
                                                        child: Container(
                                                          height: 50,
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(5),
                                                              color: Colors.red),
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 20),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'The Bot',
                                                                style: TextStyle(
                                                                    color: Colors.white,fontFamily: ''),
                                                              ),
                                                              const Spacer(),
                                                              controller.containerTwo? const Icon(
                                                                Icons.remove,
                                                                color: Colors.white,
                                                              ): const Icon(
                                                                Icons.add,
                                                                color: Colors.white,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Expanded(child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'The team must build and bring one pre-constructed, autonomous, or manual, a wireless robot whose purpose is to push, throw, flip, hit, drag, or otherwise move the opponent out of the battle ring within the maximum battle time. The following section details the rules and specifications regarding the robot; please be sure to read them carefully and refer to them as you design your robot.',
                                                              style: TextStyle(color: Colors.white,
                                                                  fontFamily: ''

                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'The participating bots can be wireless must be controlled remotely. A bot must fit inside 100 centimeters wide and 100 centimeters high cube at the beginning of a Battle. There are no size constraints once the Battle has begun, the robot can expand its parts after the battle starts. Additionally, nothing can intentionally detach from the robot. Robots will not be immediately penalized if pieces detach as a result of breakage. In the case of repeated breakage, the Referee may invalidate a Battle, request certain remedies be taken, or disqualify the Team.',
                                                              style: TextStyle(color: Colors.white,
                                                                  fontFamily: ''
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'The bot without the decoration cannot weigh over the defined limit.',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontFamily: ''
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'The decoration itself cannot weigh more than 2 Kg or 4.4 pounds.',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontFamily: ''

                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'The decoration cannot protect the robot or serve as a weapon.',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontFamily: ''
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(top: 5),
                                                                  child: CircleAvatar(
                                                                    radius: 4,
                                                                    backgroundColor: Colors.white,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'The decoration cannot easily become a fouling hazard.',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontFamily: ''
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),const SizedBox(
                                              height: 20,
                                            ),
                                            Consumer<RoboWarController>(
                                              builder: (context, value, child) {
                                                return AnimatedContainer(
                                                  width: double.infinity,
                                                  height: controller.containerThree ? 1050 : 50,
                                                  duration: const Duration(milliseconds: 100),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () =>
                                                            controller.openContainer3(),
                                                        child: Container(
                                                          height: 50,
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(5),
                                                              color: Colors.red),
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 20),
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                'The Battlebox (Arena)',
                                                                style: TextStyle(
                                                                    color: Colors.white,fontFamily: ''),
                                                              ),
                                                              const Spacer(),
                                                              controller.containerThree? const Icon(
                                                                Icons.remove,
                                                                color: Colors.white,
                                                              ): const Icon(
                                                                Icons.add,
                                                                color: Colors.white,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(child: SingleChildScrollView(
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const SizedBox(height: 20,),
                                                            const Text('The BattleBox is a fully enclosed 40-feet by 40-feet rectangle raised 1 feet off the ground. The BattleBox floor is approximately level but is not guaranteed to be flat or smooth. The BattleBox employs certain “Hazards” and other obstacles that can block, damage, and/or disable a Bot. The BattleBox may also contain debris and/or have damage from previous Matches. Competitors are encouraged to use the Hazards and obstacles to their advantage. However, TechnoXian. is not responsible for any Bot damage caused by the BattleBox itself, the Hazards, or debris within the BattleBox.',
                                                              style: TextStyle(color: Colors.white,
                                                                  fontFamily: ''

                                                              ),),
                                                            const SizedBox(
                                                              height: 400,
                                                              width: double.infinity,
                                                              child:  ModelViewer(
                                                                src: 'assets/3d/RoboSoccer.glb',
                                                                alt: "A 3D model",
                                                                autoPlay: true,
                                                                autoRotate: false,
                                                                cameraControls: true,
                                                              ),
                                                            ),
                                                            Center(child: Image.asset('assets/images/Robo-Soccer-geound.webp',height: 300,))
                                                          ],
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            const BottomNavBar()

                                          ],
                                        ),
                                      )
                                    ]),
                              )),
                              const SizedBox(width: 20,),
                            if(MediaQuery.sizeOf(context).width>1125)  Expanded(child: Container(
                                height: double.infinity,
                                margin: const EdgeInsets.only(bottom: 50,top: 50),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.07),
                                  border: Border.all(
                                    color: Colors.white12
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: const SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20,),
                                      Text('Matches',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 25
                                      ),),
                                      SizedBox(height: 20,),
                                      CountryContainer(title: 'May5', image: AppImages.japan),
                                      SizedBox(height: 15,),
                                      CountryContainer(title: 'May6', image: AppImages.india),
                                      SizedBox(height: 15,),
                                      CountryContainer(title: 'May7', image: AppImages.austrelia),
                                      SizedBox(height: 15,),
                                      CountryContainer(title: 'May8', image: AppImages.russia),
                                      SizedBox(height: 15,),
                                      CountryContainer(title: 'May9', image: AppImages.england),
                                      SizedBox(height: 15,),
                                    ],
                                  ),
                                ),
                              )),
                              const SizedBox(width: 20,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        },
      )),
    );
  }
}
