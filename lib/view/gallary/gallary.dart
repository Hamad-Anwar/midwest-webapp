import 'dart:async';
import 'package:flutter/material.dart';
import 'package:layout_pro/responsive_layout.dart';
import 'package:midwest/view/drawer/drawer.dart';
import 'package:midwest/view_model/controller/gallary_controller.dart';
import 'package:provider/provider.dart';
import '../about/about.dart';
import '../home/components/app_bar.dart';
import '../home/components/home_section.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GalleryController>(context,listen: false).getData();
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
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const CustomDrawer(),
      body: Center(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width,
                    maxHeight: MediaQuery.sizeOf(context).height),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/bg.png',fit: BoxFit.cover,),
                    Container(
                      color: Colors.black87,
                    ),
                    Column(
                      children: [
                        const TopAppBar(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'RoboWar ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.sizeOf(context).width>600? 30:15),
                              ),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:  MediaQuery.sizeOf(context).width>600? 30:15),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child: Consumer<GalleryController>(builder: (context, value, child) {

                            if(value.status==DataStatus.loading){
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }

                            if(value.status==DataStatus.complete && value.images.isEmpty){
                              return const Center(
                                child: Text(
                                  'No image availaibe',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }

                            if(value.status==DataStatus.complete && value.images.isNotEmpty){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: ResponsiveLayout(
                                    builder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(right: 10,bottom: 10),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white12,
                                              ),
                                              alignment: Alignment.center,
                                              child: const SizedBox(
                                                height: 15,
                                                width: 15,
                                                child: CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Image.network(value.images[index],fit: BoxFit.cover,)
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: value.images.length),
                                );
                            }
                            return const SizedBox();
                          },),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
