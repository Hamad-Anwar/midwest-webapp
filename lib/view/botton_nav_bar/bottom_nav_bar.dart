import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midwest/res/app_images.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top:MediaQuery.sizeOf(context).width>600? 80:20,bottom: 30),
      // color: Colors.white.withOpacity(.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png',

                width: 180,
              ),
              Spacer(),
             if(MediaQuery.sizeOf(context).width>950) Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NEED SUPPORT?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:MediaQuery.sizeOf(context).width>600? 14 : 12),),
                  SizedBox(height: 20,),
                  Text('Official@antikwar.com',style: TextStyle(color: Colors.white,
                      fontFamily: '',
                      fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
                  Text('Official@antikwar.com',style: TextStyle(
                      fontFamily: '',
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
                ],
              ),
              Spacer(),

              if(MediaQuery.sizeOf(context).width>600) Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NEED HELP?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?14:12),),
                  SizedBox(height: 20,),
                  Text('(+91)1234567890',style: TextStyle(
                      fontFamily: '',
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
                  Text(
                    '(+91)1234567890',style: TextStyle(
                      fontFamily: '',
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
                ],
              ),
              Spacer(),
              if(MediaQuery.sizeOf(context).width>430) Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FOLLOW US',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:12),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.linkedin,color: Colors.white,size: 20,),
                      SizedBox(width: 15,),
                      Icon(FontAwesomeIcons.facebook,color: Colors.white,size: 20,),
                      SizedBox(width: 15,),
                      Icon(FontAwesomeIcons.instagram,color: Colors.white,size: 20,),
                    ],
                  )
                ],
              )
            ],
          ),

          if(MediaQuery.sizeOf(context).width<=950) SizedBox(height: 40,),
          if(MediaQuery.sizeOf(context).width<=950) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NEED SUPPORT?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?14:12),),
              SizedBox(height: 20,),
              Text('Official@antikwar.com',style: TextStyle(
                  fontFamily: '',
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
              Text('Official@antikwar.com',style: TextStyle(

                  fontFamily: '',color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
            ],
          ),
          if(MediaQuery.sizeOf(context).width<=600) SizedBox(height: 40,),
          if(MediaQuery.sizeOf(context).width<=600) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NEED HELP?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?14:12),),
              SizedBox(height: 20,),
              Text('(+91)1234567890',style: TextStyle(
                  fontFamily: '',
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
              Text('(+91)1234567890',style: TextStyle(
                  fontFamily: '',
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:13),),
            ],
          ),
          if(MediaQuery.sizeOf(context).width<=600) SizedBox(height: 20,),
          if(MediaQuery.sizeOf(context).width<=430) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FOLLOW US',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width>600?15:12),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(FontAwesomeIcons.linkedin,color: Colors.white,size: 20,),
                  SizedBox(width: 15,),
                  Icon(FontAwesomeIcons.facebook,color: Colors.white,size: 20,),
                  SizedBox(width: 15,),
                  Icon(FontAwesomeIcons.instagram,color: Colors.white,size: 20,),
                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          Divider(
            color: Colors.white12,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('BE A DISTRIBUTEOR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
              fontFamily: '',
                fontSize: 10
              ),),
              Text('2024\u00a9ROBOWAR',style: TextStyle(color: Colors.grey,fontSize:10,fontWeight: FontWeight.bold,
              fontFamily: '',

              ),),
            ],
          ),
        ],
      ),
    );
  }
}
