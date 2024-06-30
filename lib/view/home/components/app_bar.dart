import 'package:flutter/material.dart';
import 'package:midwest/view/about/about.dart';
import 'package:midwest/view/gallary/gallary.dart';
import 'package:midwest/view/home/home_page.dart';
import 'package:midwest/view/register_team/register_team.dart';
import 'package:midwest/view/robowar/robowar.dart';
import 'app_bar_button.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: 10,),
          // SizedBox(width: 20,),
         MediaQuery.sizeOf(context).width>740?  Expanded(child: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: const Color(0xffdf0600),
                // image: DecorationImage(
                //     image: AssetImage(AppImages.oneSideRect,),
                //     fit: BoxFit.fill
                // )
            ),
      
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                  },
                  child: Image.asset('assets/images/IMG_20240304_183205_023.png',
                    width: 80,
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                ),
                const Spacer(),
                // AppBarButton(title: 'CALENDER',),
                const SizedBox(width: 20,),
                AppBarButton(title: 'REGISTER',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterTeam(),)),
                ),
                const SizedBox(width: 20,),
      
                // onTap: () => RegisterTeam.showPage(context: context),),
                AppBarButton(title: 'RoboWar',onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RoboWar(),)),),
                const SizedBox(width: 20,),
                AppBarButton(title: 'GALLERY',onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Gallery(),)),),
                const SizedBox(width: 20,),
                AppBarButton(title: 'ABOUT',onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage(),)),),
                const SizedBox(width: 20,),
              ],
            ),
          ))
          :Expanded(
            child: Container(
              height: 70,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                      },
                      child: Image.asset('assets/images/IMG_20240304_183205_023.png',
                        width: 80,
                        fit: BoxFit.cover,
                        height: 40,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
      
                       alignment: Alignment.center,
                       child: const Icon(Icons.menu,color: Colors.white,),
                               ),
                    ),
                    const SizedBox(width: 20,)
                  ],
                ),
              ),
            ),
          )
          ,
      
        ],
      ),
    );
  }
}
