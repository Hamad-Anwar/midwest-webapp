import 'dart:async';
import 'package:flutter/material.dart';
import 'package:midwest/res/app_images.dart';
import 'package:midwest/res/app_urls.dart';
import 'package:midwest/view/botton_nav_bar/bottom_nav_bar.dart';
import 'package:midwest/view/drawer/drawer.dart';
import 'package:midwest/view/home/components/home_center_section.dart';
import 'package:midwest/view/home/components/home_section.dart';
import 'package:midwest/view/home/components/suponsers.dart';
import 'package:midwest/view/robowar/robowar.dart';
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
        videoUrl);
    Timer(const Duration(milliseconds: 100), () {
      try {
        aboutVideoPlayer.pause();
      } catch (_) {

      }
    },);
  }

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
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
                      maxWidth: MediaQuery
                          .sizeOf(context)
                          .width, maxHeight: MediaQuery
                      .sizeOf(context)
                      .height),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset('assets/images/bg.png', fit: BoxFit.cover,),
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
                            const SizedBox(
                              height: 40,
                            ),
                            Suponsers(constraints: constraints),


                            const SizedBox(
                              height: 20,
                            ),

                            if(MediaQuery
                                .sizeOf(context)
                                .width <= 840) Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 15,),
                                Image.asset(
                                  'assets/images/pngegg (1).png', height: 50,
                                  width: 100,),
                                const SizedBox(width: 15,),
                                Image.asset(
                                  'assets/images/pngegg.png', height: 50,
                                  width: 100,),
                                const SizedBox(width: 15,),
                                Image.asset(
                                  'assets/images/pngegg (2).png', height: 80,
                                  width: 100,),
                                const SizedBox(width: 15,),

                              ],
                            ),

                            const SizedBox(height: 20,),
                            HomeCenterSection(constraints: constraints),
                            Container(
                              height: MediaQuery
                                  .sizeOf(context)
                                  .width > 600 ? 400 : 200,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          AppImages.bottomImageBg),
                                      fit: BoxFit.fill)),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  homeVideoController.pause();
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => RoboWar(),));
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 2)),
                                  child: Center(
                                      child: Text(
                                        'MY ROBOCARS',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery
                                                .sizeOf(context)
                                                .width > 600 ?
                                            14 : 12,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery
                                  .sizeOf(context)
                                  .width > 600 ? 80 : 20),
                              child: Text(
                                'All Competitions',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery
                                        .sizeOf(context)
                                        .width > 600 ?
                                    25 : 18),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
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
                                              color: Colors.white.withOpacity(
                                                  .07),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'ROBOWAR',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery
                                                        .sizeOf(context)
                                                        .width > 600 ?
                                                    18 : 13),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 180,
                                              width: 180,
                                              color: Colors.white.withOpacity(
                                                  .07),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'ROBOWAR',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery
                                                        .sizeOf(context)
                                                        .width > 600 ?
                                                    18 : 13),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 180,
                                              width: 180,
                                              color: Colors.white.withOpacity(
                                                  .07),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'ROBOWAR',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery
                                                        .sizeOf(context)
                                                        .width > 600 ?
                                                    18 : 13),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery
                                  .sizeOf(context)
                                  .width > 600 ? 80 : 20,
                            ),

                            const BottomNavBar()

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
      height: MediaQuery
          .sizeOf(context)
          .width > 600 ?
      50 : 40,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white.withOpacity(.07)),
      child: Row(
        children: [
          const SizedBox(width: 20,),

          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: MediaQuery
                .sizeOf(context)
                .width > 600 ?
            50 : 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize:
            MediaQuery
                .sizeOf(context)
                .width > 600 ?
            13 : 11
            ),
          ),
          const Spacer(),
          if (date != null && date!.isNotEmpty)
            SizedBox(
                width: MediaQuery
                    .sizeOf(context)
                    .width > 600 ? 70 : 60,
                child: Text(
                  date!,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: '',
                      fontSize:
                      MediaQuery
                          .sizeOf(context)
                          .width > 600 ?
                      13 : 11),
                )),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }
}
