import 'package:flutter/material.dart';

class RoboWarText extends StatelessWidget {
  const RoboWarText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('WRC BOTS COMBAT',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30
        ),),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Text('August 24th, 2024 - August 27th, 2024',
            style: TextStyle(color: Colors.white70,
                fontFamily: '',
                fontWeight: FontWeight.w100
            ),
          ),
        ),
        Text('The Challenge is to design and build a robot competent to fight other robots in Battle. The competition is carried out in a tournament format in which the competitors bring their wireless robots ready to battle and are pitted against their competitor’s robots in a one-one match where the aim is to cause maximum damage or to push the opponent’s robot off the arena to score maximum points. The team scoring the maximum points wins the championship. The challenge has two participation categories as per the gross weight of the Robot.',
          style: TextStyle(color: Colors.white,
              fontFamily: '',
              fontWeight: FontWeight.w100,
              fontSize: 12
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'The ',
                        style: TextStyle(fontFamily: '',
                            color: Colors.white,
                            fontSize: 12
                        )
                    ),
                    TextSpan(
                        text: '15 kg ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'category is open for all, with ',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                    TextSpan(
                        text: '75 teams ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'eligible to participate, including both national and international countries.',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 12

                        )
                    ),
                  ]
              )),
            ),
          ],
        ),



        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'The ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 12
                        )
                    ),
                    TextSpan(
                        text: '30 kg ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'category is open for all, with ',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                    TextSpan(
                        text: '50 teams ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'eligible to participate, including both national and international countries.',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 12

                        )
                    ),
                  ]
              )),
            ),
          ],
        )
        ,


        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'The ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 12
                        )
                    ),
                    TextSpan(
                        text: '60 kg ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'category is open for all, with ',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                    TextSpan(
                        text: '20 teams ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'eligible to participate, including both national and international countries.',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 12

                        )
                    ),
                  ]
              )),
            ),
          ],
        )
        ,



        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'All participants will get a certification of Participation from',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 12
                        )
                    ),
                    TextSpan(
                        text: ' “All India Council For Robotics & Automation (AICRA)” ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'and the Ministry of Electronics & Information Technology, ',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                    TextSpan(
                        text: 'Govt of India.',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),



        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: '15 kg INR: ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: ' 1st prize 75000, 2nd prize 50000, and 3rd prize 25000 to be awarded to winning teams',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),


        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: '30 kg INR: ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: ' 1st prize 75000, 2nd prize 50000, and 3rd prize 25000 to be awarded to winning teams.',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),

        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: '60 kg INR: ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: '1st prize 100000, 2nd prize 60000, and 3rd prize 40000 to be awarded to winning teams.',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),


        SizedBox(height: 20,),
        Text('Eligibility Criteria',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20
        ),),
        SizedBox(height: 20,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'Under 15Kg (33 LBS): ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'Open for all School/Colleges/Universities/Individual every age group can participate.',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'Under 30Kg (66 LBS): ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'Open for all School/Colleges/Universities/Individual every age group can participate.',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            CircleAvatar(radius: 4,backgroundColor: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'Under 60 Kg (133 LBS): ',
                        style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextSpan(
                        text: 'Open for all School/Colleges/Universities/Individual every age group can participate.',
                        style: TextStyle(
                          fontFamily: '',
                          color: Colors.white,
                        )
                    ),
                  ]
              )),
            ),
          ],
        ),
      ],
    );
  }
}
