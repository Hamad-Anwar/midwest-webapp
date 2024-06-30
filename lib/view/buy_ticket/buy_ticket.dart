import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:midwest/view/drawer/drawer.dart';
import 'package:midwest/view_model/controller/buy_ticket_controller.dart';
import 'package:provider/provider.dart';

import '../../res/app_images.dart';
import '../about/about.dart';
import '../home/components/app_bar.dart';
import '../home/components/home_section.dart';
import '../register_team/components/input_field.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({super.key});

  @override
  State<BuyTicket> createState() => _BuyTicketState();

  static buy() async {}
}

class _BuyTicketState extends State<BuyTicket> {
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
    final controller = Provider.of<BuyTicketController>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const CustomDrawer(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height,
                maxWidth: MediaQuery.sizeOf(context).width,
              ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
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
                          Align(
                            alignment: Alignment.center,
                            child: Card(
                              surfaceTintColor: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.sizeOf(context).width > 600
                                      ? 50
                                      : 10),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width > 700
                                    ? 700
                                    : MediaQuery.sizeOf(context).width,
                                height: 600,
                                child: SingleChildScrollView(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: Form(
                                    key: controller.formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: _buildText(
                                                  'Welcome to the RoboWar visitor pass registration',
                                                  fontSize: 14),
                                            ),
                                            InkWell(
                                                onTap: () => Navigator.pop(context),
                                                child: const Icon(Icons.close,color: Colors.black,))
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        _buildText(
                                          'All India Council for Robowar & Automation is delighted to invite you to 1.0st Edition of\nRobowar World Championship',
                                          color: Colors.black.withOpacity(.5),
                                          fontSize: 12,
                                        ),
                                        const SizedBox(height: 10),
                                        _buildText('Robowar Team Registration page',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                        const SizedBox(height: 6),
                                        _buildDivider(),
                                        const SizedBox(height: 10),
                                        _buildInputRow(
                                          'Name',
                                          'Email',
                                          context,
                                          controller.name,
                                          controller.email,
                                          validator2: (p0) {
                                            if (EmailValidator.validate(
                                                p0.toString())) {
                                              return null;
                                            }
                                            return 'Please enter valid email';
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        _buildInputRow(
                                          'Mobile Number',
                                          'City',
                                          context,
                                          controller.mobileNumber,
                                          controller.city,
                                          validator1: (p0) {
                                            RegExp regExp = RegExp(r'^\+\d{12}$');
                                            if (regExp.hasMatch(p0.toString())) {
                                              return null;
                                            } else {
                                              return 'Enter valid number';
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 30),
                                        _buildSubmitButton(
                                          onTap: () => controller.submit(context),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildText(String text,
      {Color color = Colors.black,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 6,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.shade900,
      ),
    );
  }

  Widget _buildInputField(
      {required String hint,
      required String title,
      required TextEditingController controller,
      String? Function(String?)? validator}) {
    return Expanded(
      child: InputField(
        controller: controller,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
        hint: hint,
        title: title,
      ),
    );
  }

  Widget _buildInputRow(String title1, String title2, BuildContext context,
      TextEditingController controller1, TextEditingController controller2,
      {String? Function(String?)? validator1,
      String? Function(String?)? validator2}) {
    return Column(
      children: [
        Row(
          children: [
            _buildInputField(
                title: title1,
                hint: '',
                controller: controller1,
                validator: validator1),
            const SizedBox(width: 10),
            if (MediaQuery.sizeOf(context).width > 600)
              _buildInputField(
                  title: title2,
                  hint: '',
                  controller: controller2,
                  validator: validator2),
          ],
        ),
        if (MediaQuery.sizeOf(context).width <= 600 && title2.isNotEmpty)
          const SizedBox(
            height: 10,
          ),
        if (MediaQuery.sizeOf(context).width <= 600 && title2.isNotEmpty)
          InputField(
            hint: '',
            controller: controller2,
            title: title2,
            validator: validator2 ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
          )
      ],
    );
  }

  Widget _buildSubmitButton({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.red,
        ),
        alignment: Alignment.center,
        child: const Text(
          'SUBMIT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
