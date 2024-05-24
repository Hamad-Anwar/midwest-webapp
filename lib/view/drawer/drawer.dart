import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midwest/res/app_images.dart';
import 'package:midwest/view/about/about.dart';
import 'package:midwest/view/home/components/home_section.dart';
import 'package:midwest/view/register_team/register_team.dart';
import 'package:midwest/view/robowar/robowar.dart';
import 'package:midwest/view_model/controller/register_team_controller.dart';
import 'package:provider/provider.dart';

import '../gallary/gallary.dart';
import '../home/components/app_bar_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(child: Column(children: [
              Expanded(child: Image.asset(AppImages.carImageGroup)),
            ],)),
            const SizedBox(height: 20,),
             Padding(padding: EdgeInsets.only(left: 0),
            child: Column(
              children: [
                // Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                //   child:
                //   AppBarButton(title: 'CALENDER',textStyle: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                // ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child:
                  AppBarButton(title: 'TEAM REGISTER',textStyle: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),
                  onTap: (){
                    Navigator.pop(context);
                    homeVideoController.pause();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTeam(),));
                    Provider.of<RegisterTeamController>(context).changeRegister(value: false);

                  },
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child:
                  AppBarButton(title: 'PARTICIPATE',textStyle: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),
                    onTap: (){
                      homeVideoController.pause();
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTeam(),));
                      Provider.of<RegisterTeamController>(context).changeRegister(value: true);

                    },
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child:
                  AppBarButton(title: 'RoboWar',onTap: (){
                    Navigator.pop(context);
                    homeVideoController.pause();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RoboWar(),));
                  },textStyle: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                ),Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child:
                  AppBarButton(title: 'GALLERY',onTap: (){
                    Navigator.pop(context);
                    homeVideoController.pause();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery(),));
                  },textStyle: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child:
                  AppBarButton(title: 'ABOUT',textStyle: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),
                      onTap: () {
                        Navigator.pop(context);
                        homeVideoController.pause();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(),));
                      }
                  ),
                ),


              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
