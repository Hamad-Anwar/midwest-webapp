import 'package:flutter/material.dart';

import '../../../res/app_images.dart';
import '../../about/about.dart';
import '../../buy_ticket/buy_ticket.dart';
import '../../register_team/register_team.dart';
import '../home_page.dart';
import 'home_section.dart';

class HomeCenterSection extends StatelessWidget {
  const HomeCenterSection({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
          left: constraints.maxWidth > 600 ? 60 : 20,
          right: constraints.maxWidth > 600 ? 60 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(
            height: 30,
          ),
          Container(
            height: 400,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: 40),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.07)),
            child: Stack(
              children: [
                Align(
                    alignment: MediaQuery
                        .sizeOf(context)
                        .width > 500 ? Alignment
                        .centerRight : Alignment.center,
                    child:
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery
                              .sizeOf(context)
                              .width > 500 ? 0 : 50),
                      child: Image.asset(
                          AppImages.carImageGroup),
                    )),
                Positioned(
                  top: 1,
                  bottom: 1,
                  left: 1,
                  right: 1,
                  child: Column(
                    crossAxisAlignment: MediaQuery
                        .sizeOf(context)
                        .width > 500
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'WHAT IS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: constraints
                              .maxWidth > 600
                              ? 24
                              : 18,
                        ),),
                      Text(
                        'Robowar?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: constraints
                              .maxWidth > 600
                              ? 25
                              : 21,
                        ),),

                      Text(
                        'Experience adrenaline-pumping action as you engage in intense battles against players from around the globe.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: constraints
                                .maxWidth > 600
                                ? 15
                                : 10,
                            fontFamily: ''
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          homeVideoController.pause();
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AboutPage(),));
                        },
                        child: Container(
                          height: MediaQuery
                              .sizeOf(context)
                              .width > 600 ? 50 : 40,
                          width: MediaQuery
                              .sizeOf(context)
                              .width > 600 ? 200 : 140,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      AppImages
                                          .buttonBg),
                                  fit: BoxFit.fill)),
                          alignment: Alignment.center,
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight
                                    .bold,
                                fontFamily: '',
                                fontSize:
                                MediaQuery
                                    .sizeOf(context)
                                    .width > 600
                                    ? 20
                                    : 15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
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
                    constraints.maxWidth > 600
                        ? 25
                        : 20,
                    height: 0),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5),
                child: SizedBox(
                  width: constraints.maxWidth > 600
                      ? 200
                      : 100,
                  height: 7,
                  child: Image.asset(
                    AppImages.oneSideRect,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CountryContainer(
            title: 'INDIA', image: AppImages.india,
            date: '0.0 PTS',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'AUSTRALIA',
            image: AppImages.austrelia,
            date: '0.0 PTS',

          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'JAPAN', image: AppImages.japan,
            date: '0.0 PTS',

          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'ENGLAND', image: AppImages.england,
            date: '0.0 PTS',

          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'RUSSIA', image: AppImages.russia,
            date: '0.0 PTS',

          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 20, top: 10),
            child: TextButton(onPressed: () {

            }, child: const Text('See All', style: TextStyle(
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
          const SizedBox(
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
                    constraints.maxWidth > 600
                        ? 25
                        : 20,
                    height: 0),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5),
                child: SizedBox(
                  width: constraints.maxWidth > 600
                      ? 200
                      : 100,
                  height: 7,
                  child: Image.asset(
                    AppImages.oneSideRect,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Text(
                'QUALIFICATIONS',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery
                        .sizeOf(context)
                        .width > 600 ?
                    20 : 15),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                '(Stage 1)',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery
                        .sizeOf(context)
                        .width > 600 ?
                    18 : 13),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CountryContainer(
            title: 'INDIA',
            image: AppImages.india,
            date: 'MAY 5',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'AUSTRALIA',
            image: AppImages.austrelia,
            date: 'MAY 12',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'JAPAN',
            image: AppImages.japan,
            date: 'MAY 19',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'ENGLAND',
            image: AppImages.england,
            date: 'MAY 26',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'RUSSIA',
            image: AppImages.russia,
            date: 'JUNE 2',
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Text(
                'END WAR',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery
                        .sizeOf(context)
                        .width > 600 ?
                    20 : 15),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                '(Stage 2)',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery
                        .sizeOf(context)
                        .width > 600 ?
                    18 : 13),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CountryContainer(
            title: 'INDIA',
            image: AppImages.india,
            date: 'MAY 5',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'AUSTRALIA',
            image: AppImages.austrelia,
            date: 'MAY 12',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'JAPAN',
            image: AppImages.japan,
            date: 'MAY 19',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'ENGLAND',
            image: AppImages.england,
            date: 'MAY 26',
          ),
          const SizedBox(
            height: 10,
          ),
          const CountryContainer(
            title: 'RUSSIA',
            image: AppImages.russia,
            date: 'JUNE 2',
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () =>
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BuyTicket(),)),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  height: MediaQuery
                      .sizeOf(context)
                      .width > 600 ? 50 : 40,
                  width: (constraints.maxWidth > 600)
                      ? 250
                      : 150,
                  margin: const EdgeInsets.only(
                      left: 0, top: 50),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              AppImages.buttonBg),
                          fit: BoxFit.fill)),
                  alignment: Alignment.center,
                  child: Text(
                    'BOOK TICKET',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: '',
                        fontSize:
                        constraints.maxWidth > 600
                            ? 15
                            : 13),
                  ),
                ),
              ),
              if (constraints.maxWidth > 600)
                const SizedBox(
                  width: 100,
                ),
              if (constraints.maxWidth <= 600)
                const SizedBox(
                  width: 20,
                ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegisterTeam(),));
                },
                child: Container(
                  height: MediaQuery
                      .sizeOf(context)
                      .width > 600 ? 50 : 40,
                  width: (constraints.maxWidth > 600)
                      ? 250
                      : 150,
                  margin: const EdgeInsets.only(
                      left: 0, top: 50),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              AppImages.buttonBg),
                          fit: BoxFit.fill)),
                  alignment: Alignment.center,
                  child: Text(
                    'PARTICIPATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: '',
                        fontWeight: FontWeight.bold,
                        fontSize:
                        constraints.maxWidth > 600
                            ? 15
                            : 13),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
