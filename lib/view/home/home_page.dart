import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:midwest/res/app_images.dart';
import 'package:midwest/view/botton_nav_bar/bottom_nav_bar.dart';
import 'package:midwest/view/buy_ticket/buy_ticket.dart';
import 'package:midwest/view/drawer/drawer.dart';
import 'package:midwest/view/home/components/app_bar.dart';
import 'package:midwest/view/home/components/home_section.dart';
import 'package:midwest/view/home/components/video_section.dart';
import 'package:midwest/view/register_team/register_team.dart';
import 'package:midwest/view/robowar/robowar.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../../view_model/controller/home_controller.dart';
import '../about/about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Provider.of<HomeController>(context, listen: false).init(
        url:
            'https://firebasestorage.googleapis.com/v0/b/midwest-20922.appspot.com/o/video%2FRobot%20Wars-%20Episode%205%20Battle%20Recaps%202017%20-%20BBC%20Two_2.mp4?alt=media&token=871c30f4-5f72-4514-965d-20ac1bdc3e53');
    Timer(Duration(milliseconds: 100), () {
      try{
        // homeVideoController.pause();
        aboutVideoPlayer.pause();
      }catch(_){

      }
    },);
  }

  final ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: RawScrollbar(
        controller: controller,
        thumbColor: Colors.white70,
        thickness: 10,
        trackColor: Colors.white60,
        trackVisibility: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
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
                      controller: controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const HomeSection(),
                          // SizedBox(
                          //   height: 60,
                          // ),
                          // VideoSection(
                          //   constraints: constraints,
                          // ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: constraints.maxWidth > 600 ? 60 : 20,
                                left: constraints.maxWidth > 600 ? 60 : 20
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OUR',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: constraints.maxWidth > 600
                                            ? 24
                                            : 18,
                                      ),
                                    ),
                                    Text(
                                      'SPONSORS',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: constraints.maxWidth > 600 ? 25 : 20,),
                                    ),
                                  ],
                                ),
                                Spacer(),
                               if(MediaQuery.sizeOf(context).width>840) Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15,),
                                    Image.asset('assets/images/pngegg (1).png',height: 50,width: 100,),
                                    SizedBox(width: 15,),
                                    Image.asset('assets/images/pngegg.png',height: 50,width: 100,),
                                    SizedBox(width: 15,),
                                    Image.asset('assets/images/pngegg (2).png',height: 80,width: 100,),
                                    SizedBox(width: 15,),

                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: MediaQuery.sizeOf(context).width / 5,
                                        height: 15,
                                        child: Image.asset(
                                          AppImages.oneSideRect,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: MediaQuery.sizeOf(context).width / 6,
                                        height: 15,
                                        child: Image.asset(
                                          AppImages.oneSideRect,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),


                          SizedBox(
                            height: 20,
                          ),

                          if(MediaQuery.sizeOf(context).width<=840) Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15,),
                              Image.asset('assets/images/pngegg (1).png',height: 50,width: 100,),
                              SizedBox(width: 15,),
                              Image.asset('assets/images/pngegg.png',height: 50,width: 100,),
                              SizedBox(width: 15,),
                              Image.asset('assets/images/pngegg (2).png',height: 80,width: 100,),
                              SizedBox(width: 15,),

                            ],
                          ),

                          SizedBox(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth > 600 ? 60 : 20,
                                right: constraints.maxWidth > 600 ? 60 : 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 400,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.07)),
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment:MediaQuery.sizeOf(context).width>500? Alignment.centerRight : Alignment.center,
                                          child:
                                          Padding(
                                            padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).width>500?0:50),
                                            child: Image.asset(AppImages.carImageGroup),
                                          )),
                                      Positioned(
                                        top:1,
                                        bottom: 1,
                                        left: 1,
                                        right: 1,
                                        child: Column(
                                          crossAxisAlignment: MediaQuery.sizeOf(context).width>500? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Text(
                                              'WHAT IS',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: constraints.maxWidth > 600
                                                    ? 24
                                                    : 18,
                                              ),),
                                            Text(
                                              'Robowar?',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: constraints.maxWidth > 600
                                                    ? 25
                                                    : 21,
                                              ),),

                                            Text('Experience adrenaline-pumping action as you engage in intense battles against players from around the globe.',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: constraints.maxWidth > 600?15 :  10,
                                              fontFamily: ''
                                            ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: () {
                                                homeVideoController.pause();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(),));
                                              },
                                              child: Container(
                                                height: MediaQuery.sizeOf(context).width>600? 50 : 40,
                                                width: MediaQuery.sizeOf(context).width>600? 200 : 140,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            AppImages.buttonBg),
                                                        fit: BoxFit.fill)),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'About Us',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: '',
                                                      fontSize:
                                                      MediaQuery.sizeOf(context).width>600? 20 : 15),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'TEAMS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize:
                                          constraints.maxWidth > 600 ? 25 : 20,
                                          height: 0),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: SizedBox(
                                        width: constraints.maxWidth > 600 ? 200 : 100,
                                        height: 7,
                                        child: Image.asset(
                                          AppImages.oneSideRect,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CountryContainer(
                                    title: 'INDIA', image: AppImages.india,
                                date: '0.0 PTS',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                    title: 'AUSTRALIA', image: AppImages.austrelia,
                                  date: '0.0 PTS',

                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                    title: 'JAPAN', image: AppImages.japan,
                                  date: '0.0 PTS',

                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                    title: 'ENGLAND', image: AppImages.england,
                                  date: '0.0 PTS',

                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                    title: 'RUSSIA', image: AppImages.russia,
                                  date: '0.0 PTS',

                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10),
                                  child: TextButton(onPressed: () {

                                  }, child: Text('See All',style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  ),)),
                                ),


                                // Container(
                                //   height: 45,
                                //   width: 160,
                                //   margin: EdgeInsets.only(left: 40, top: 50),
                                //   decoration: BoxDecoration(
                                //       image: DecorationImage(
                                //           image: AssetImage(AppImages.buttonBg),
                                //           fit: BoxFit.fill)),
                                //   alignment: Alignment.center,
                                //   child: Text(
                                //     'SEE ALL',
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 20),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'CALENDER',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize:
                                          constraints.maxWidth > 600 ? 25 : 20,
                                          height: 0),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: SizedBox(
                                        width: constraints.maxWidth > 600 ? 200 : 100,
                                        height: 7,
                                        child: Image.asset(
                                          AppImages.oneSideRect,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      'QUALIFICATIONS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.sizeOf(context).width>600?
                                          20  : 15),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      '(Stage 1)',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.sizeOf(context).width>600?
                                          18  : 13),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CountryContainer(
                                  title: 'INDIA',
                                  image: AppImages.india,
                                  date: 'MAY 5',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'AUSTRALIA',
                                  image: AppImages.austrelia,
                                  date: 'MAY 12',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'JAPAN',
                                  image: AppImages.japan,
                                  date: 'MAY 19',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'ENGLAND',
                                  image: AppImages.england,
                                  date: 'MAY 26',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'RUSSIA',
                                  image: AppImages.russia,
                                  date: 'JUNE 2',
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      'END WAR',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.sizeOf(context).width>600?
                                          20  : 15),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      '(Stage 2)',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.sizeOf(context).width>600?
                                          18  : 13),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CountryContainer(
                                  title: 'INDIA',
                                  image: AppImages.india,
                                  date: 'MAY 5',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'AUSTRALIA',
                                  image: AppImages.austrelia,
                                  date: 'MAY 12',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'JAPAN',
                                  image: AppImages.japan,
                                  date: 'MAY 19',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'ENGLAND',
                                  image: AppImages.england,
                                  date: 'MAY 26',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CountryContainer(
                                  title: 'RUSSIA',
                                  image: AppImages.russia,
                                  date: 'JUNE 2',
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket(),)),
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      child: Container(
                                        height: MediaQuery.sizeOf(context).width>600? 50 : 40,
                                        width: (constraints.maxWidth > 600) ? 250 : 150,
                                        margin: EdgeInsets.only(left: 0, top: 50),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(AppImages.buttonBg),
                                                fit: BoxFit.fill)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'BOOK TICKET',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: '',
                                              fontSize:
                                              constraints.maxWidth > 600 ? 15: 13),
                                        ),
                                      ),
                                    ),
                                    if (constraints.maxWidth > 600)
                                      SizedBox(
                                        width: 100,
                                      ),
                                    if (constraints.maxWidth <=600)
                                      SizedBox(
                                        width: 20,
                                      ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTeam(),));
                                      },
                                      child: Container(
                                        height: MediaQuery.sizeOf(context).width>600? 50 : 40,
                                        width: (constraints.maxWidth > 600) ? 250 : 150,
                                        margin: EdgeInsets.only(left: 0, top: 50),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(AppImages.buttonBg),
                                                fit: BoxFit.fill)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'PARTICIPATE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: '',
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              constraints.maxWidth > 600 ? 15 : 13),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).width>600? 400 : 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.bottomImageBg),
                                    fit: BoxFit.fill)),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                homeVideoController.pause();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RoboWar(),));
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red, width: 2)),
                                child: Center(
                                    child: Text(
                                      'MY ROBOCARS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.sizeOf(context).width>600?
                                          14  : 12,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width>600?80: 20),
                            child: Text(
                              'All Competitions',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.sizeOf(context).width>600?
                                  25  : 18),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 180,
                                            color: Colors.white.withOpacity(.07),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'ROBOWAR',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.sizeOf(context).width>600?
                                                  18  : 13),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 180,
                                            width: 180,
                                            color: Colors.white.withOpacity(.07),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'ROBOWAR',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.sizeOf(context).width>600?
                                                  18  : 13),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 180,
                                            width: 180,
                                            color: Colors.white.withOpacity(.07),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'ROBOWAR',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.sizeOf(context).width>600?
                                                  18  : 13),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).width>600? 80 : 20,
                          ),




                          BottomNavBar()


                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 40),
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment: constraints.maxWidth > 600
                          //             ? MainAxisAlignment.end
                          //             : MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Text(
                          //             'Latest News',
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize:
                          //                     constraints.maxWidth > 600 ? 20 : 17),
                          //           ),
                          //           SizedBox(
                          //             width: constraints.maxWidth > 600 ? 150 : 0,
                          //           ),
                          //           Text(
                          //             'Services',
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize:
                          //                     constraints.maxWidth > 600 ? 20 : 17),
                          //           ),
                          //           SizedBox(
                          //             width: constraints.maxWidth > 600 ? 150 : 0,
                          //           ),
                          //           Text(
                          //             'News Letter',
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize:
                          //                     constraints.maxWidth > 600 ? 20 : 17),
                          //           ),
                          //         ],
                          //       ),
                          //       SizedBox(
                          //         height: 30,
                          //       ),
                          //       Row(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             height: 40,
                          //             width: constraints.maxWidth > 600 ? 150 : 100,
                          //             decoration: BoxDecoration(color: Colors.red),
                          //             alignment: Alignment.center,
                          //             child: Text(
                          //               'LOGO',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 18),
                          //             ),
                          //           ),
                          //           Text(
                          //             'Email Adress',
                          //             style:
                          //                 TextStyle(color: Colors.grey, fontSize: 18),
                          //           )
                          //         ],
                          //       ),
                          //       SizedBox(
                          //         height: 10,
                          //       ),
                          //       Align(
                          //         alignment: Alignment.topRight,
                          //         child: Text(
                          //           'rh676838@gmail.com',
                          //           style: TextStyle(color: Colors.white38),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 30,
                          //       ),
                          //       Align(
                          //         alignment: Alignment.topRight,
                          //         child: Container(
                          //           height: 40,
                          //           width: 150,
                          //           decoration: BoxDecoration(color: Colors.red),
                          //           alignment: Alignment.center,
                          //           child: Text(
                          //             'Subscribe',
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize: 18),
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 50,
                          //       ),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text(
                          //             '@ROBOWARS2024',
                          //             style: TextStyle(
                          //                 fontSize: 12, color: Colors.white70),
                          //           ),
                          //           Row(
                          //             children: [
                          //               Icon(
                          //                 Icons.facebook,
                          //                 color: Colors.white,
                          //               ),
                          //               SizedBox(
                          //                 width: 10,
                          //               ),
                          //               Icon(
                          //                 Icons.facebook,
                          //                 color: Colors.white,
                          //               ),
                          //               SizedBox(
                          //                 width: 10,
                          //               ),
                          //               Icon(
                          //                 Icons.facebook,
                          //                 color: Colors.white,
                          //               ),
                          //             ],
                          //           ),
                          //           Text(
                          //             'Privacy Policy',
                          //             style: TextStyle(
                          //                 fontSize: 12, color: Colors.white70),
                          //           ),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              );
            },
          ),
        ),
      ),
    );
  }
}

class CountryContainer extends StatelessWidget {
  const CountryContainer(
      {super.key, required this.title, required this.image, this.date});

  final String title;
  final String image;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width>600?
       50 : 40,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white.withOpacity(.07)),
      child: Row(
        children: [
          SizedBox(width: 20,),

          // if (date != null && date!.isNotEmpty)
          //   SizedBox(
          //      width:MediaQuery.sizeOf(context).width>600?40:20,
          //   ),
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width:MediaQuery.sizeOf(context).width>600?
            50 : 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize:
            MediaQuery.sizeOf(context).width>600?
            13  : 11
            ),
          ),
          Spacer(),
          if (date != null && date!.isNotEmpty)
            SizedBox(
                width:MediaQuery.sizeOf(context).width>600?70 : 60,
                child: Text(
                  date!,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: '',
                      fontSize:
                      MediaQuery.sizeOf(context).width>600?
                      13  : 11),
                )),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
