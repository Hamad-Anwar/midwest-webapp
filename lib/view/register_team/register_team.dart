import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:midwest/res/app_images.dart';
import 'package:midwest/view/register_team/components/input_field.dart';
import 'package:midwest/view/register_team/components/register_event.dart';
import 'package:midwest/view_model/controller/register_team_controller.dart';
import 'package:provider/provider.dart';
import '../about/about.dart';
import '../drawer/drawer.dart';
import '../home/components/app_bar.dart';
import '../home/components/home_section.dart';

BuildContext? registerTeamContext;

class RegisterTeam extends StatefulWidget {
  const RegisterTeam({super.key});

  @override
  State<RegisterTeam> createState() => _RegisterTeamState();
}

class _RegisterTeamState extends State<RegisterTeam> {
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
    registerTeamContext = context;
    final controller = Provider.of<RegisterTeamController>(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.topCenter,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TopAppBar(),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 800,
                          child: Stack(
                            children: [
                              Image.asset(AppImages.leftRec),
                              Positioned(
                                right: 1,
                                child: Image.asset(AppImages.rightRec),
                              ),
                              Positioned(
                                bottom: 1,
                                top: 1,
                                child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Image.asset(AppImages.leftRec)),
                              ),
                              Positioned(
                                bottom: 1,
                                top: 1,
                                right: 1,
                                child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Image.asset(AppImages.rightRec)),
                              ),
                              Card(
                                surfaceTintColor: Colors.white,
                                margin: EdgeInsets.only(
                                    left: MediaQuery.sizeOf(context).width > 600
                                        ? 50
                                        : 10,
                                    right: MediaQuery.sizeOf(context).width > 600
                                        ? 50
                                        : 10,
                                    top: MediaQuery.sizeOf(context).width > 600
                                        ? 50
                                        : 10),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width > 900
                                      ? 900
                                      : MediaQuery.sizeOf(context).width,
                                  height: 700,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (MediaQuery.sizeOf(context).width > 860)
                                        Container(
                                          width: 400,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/360_F_244744420_ATNppnCCOUqMhdim2LXyxbWwYuskTjnU.jpg'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                  Radius.circular(10))),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Center(
                                                  child: Image.asset(
                                                      'assets/images/logo.png',
                                                    width: 60,
                                                  )),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text('INFORMATION',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20)),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text(
                                                '1.First filling up the registration form and check your registered email id for your Roboclub Id.',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                '2.After registration go to login panel and update profile is mandatory',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text('PASSWORD INSTRUCTIONS',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                '1.At least 8 characters the more characters, the better',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                '2.A mixture of both uppercase and lowercase letters',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                '3.A mixture of letters and numbers',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                '4.Inclusion of at least one special character, e.g., ! @ # ? ]' +
                                                    'do not use < or > in your password, as both can cause problems in Web browsers',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  // Container(
                                                  //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                  //   decoration: BoxDecoration(
                                                  //     color: Colors.white,
                                                  //     borderRadius: BorderRadius.circular(10),
                                                  //   ),
                                                  //   alignment: Alignment.center,
                                                  //   child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                  // ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'Guidelines for Registration',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Form(
                                                key: controller.formKey,
                                                child: controller.registerEvents? const RegisterEvent():
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Expanded(child: Text(
                                                          'Robowar Team Registration page',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15),
                                                        ),),
                                                        InkWell(
                                                            onTap: () => Navigator.pop(context),
                                                            child: const Icon(Icons.close,color: Colors.black,)),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    InputField(
                                                      controller:
                                                      controller.instituteName,
                                                      hint: 'Institute Name',
                                                      title: 'Institute/School Name',
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.personName,
                                                            hint: 'Name',
                                                            title: 'Person',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.emailId,
                                                            validator: (p0) {
                                                              if (EmailValidator
                                                                  .validate(p0
                                                                  .toString())) {
                                                                return null;
                                                              }
                                                              return 'Please enter valid email';
                                                            },
                                                            hint: 'Email id',
                                                            title: 'Email id',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    InputField(
                                                      controller: controller.club,
                                                      hint: 'Team ID',
                                                      title: 'Team Id',
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.contactNo,
                                                            hint: 'Mobile No',
                                                            title: 'Mobile No',
                                                            validator: (p0) {
                                                              RegExp regExp = RegExp(
                                                                  r'^\+\d{12}$');
                                                              if (regExp.hasMatch(
                                                                  p0.toString())) {
                                                                return null;
                                                              } else {
                                                                return 'Enter valid number';
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.password,
                                                            hint: 'Password',
                                                            title: '',
                                                            showText: controller
                                                                .showPassword,
                                                            sufix: GestureDetector(
                                                              onTap: () => controller
                                                                  .showPass(!controller
                                                                  .showPassword),
                                                              child: Container(
                                                                height: 40,
                                                                width: 20,
                                                                decoration:
                                                                const BoxDecoration(
                                                                  color:
                                                                  Colors.black12,
                                                                ),
                                                                alignment:
                                                                Alignment.center,
                                                                child: const Icon(
                                                                  Icons
                                                                      .remove_red_eye_outlined,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.country,
                                                            hint: 'Country Name',
                                                            title: 'Country',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.state,
                                                            hint: 'State Name',
                                                            title: 'State',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: InputField(
                                                            controller:
                                                            controller.city,
                                                            hint: 'City Name',
                                                            title: 'City',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(child:

                                                        Container(),),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),

                                                    ListView.builder(
                                                        itemCount: controller.players.length,
                                                        shrinkWrap: true,
                                                        itemBuilder: (context, index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(bottom: 10),
                                                            child: Row(
                                                              children: [
                                                                Expanded(child: InputField(title: index==0? 'Captain Name' : 'Player ${index+1} Name', hint: index==0? 'Enter Captain Name' :  'Enter player${index+1} name',
                                                                controller: controller.players[index]['name'],
                                                                )),
                                                                const SizedBox(width: 10,),
                                                                Expanded(child: InputField(title: index==0? 'Captain Email' : 'Player ${index+1} Email', hint:index==0? 'Enter captain email' : 'Enter player${index+1} email',
                                                                  controller: controller.players[index]['email'],
                                                                  validator: (p0) {
                                                                    if(EmailValidator.validate(controller.players[index]['email']!.value.text.toString())){
                                                                      return null;
                                                                    }
                                                                    return "Please Enter valid email";
                                                                  },
                                                                )),
                                                              ],
                                                            ),
                                                          );
                                                        },),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      'You can add 20 players in your team by clicking add player button.',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 35,
                                                            child: ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                    const MaterialStatePropertyAll(
                                                                        Colors.blue),
                                                                    shape: MaterialStatePropertyAll(
                                                                        RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                5)))),
                                                                onPressed: () {
                                                                  controller.addPlayer();
                                                                },
                                                                child: const Text(
                                                                  'Add Player +',
                                                                  style: TextStyle(
                                                                    height: 0,
                                                                      fontFamily: '',
                                                                      color: Colors.white),
                                                                )),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Expanded(child: SizedBox(
                                                          height: 35,
                                                          width: 180,
                                                          child: ElevatedButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                  const MaterialStatePropertyAll(
                                                                      Colors.blue),
                                                                  shape: MaterialStatePropertyAll(
                                                                      RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              5)))),
                                                              onPressed: () {
                                                                if(controller.loading){
                                                                  return;
                                                                }
                                                                controller
                                                                    .registerTeam(context);
                                                              },
                                                              child: Consumer<RegisterTeamController>(
                                                                builder: (context, value, child) {
                                                                  return value.loading?const Center(
                                                                    child: SizedBox(height: 15,width: 15,
                                                                      child: CircularProgressIndicator(color: Colors.white,),),
                                                                  ) : const Center(
                                                                    child: Text(
                                                                      'Register',
                                                                      style: TextStyle(height: 0, color: Colors.white,fontFamily: ''),
                                                                    ),
                                                                  );
                                                                },
                                                              )
                                                          ),
                                                        ),),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller.changeRegister(value: true);
                                                      },
                                                      child: const Text.rich(TextSpan(children: [
                                                        TextSpan(
                                                            text: 'Click here to ',
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 11)),
                                                        TextSpan(
                                                          text: 'Register Event',
                                                          style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        )
                                                      ])),
                                                    ),
                                                    const SizedBox(
                                                      height: 80,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
