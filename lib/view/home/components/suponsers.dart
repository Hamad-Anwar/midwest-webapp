import 'package:flutter/material.dart';

import '../../../res/app_images.dart';

class Suponsers extends StatelessWidget {
  const Suponsers({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: constraints.maxWidth > 600 ? 60 : 20,
          left: constraints.maxWidth > 600 ? 60 : 20
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start,
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
                  fontSize: constraints.maxWidth > 600
                      ? 25
                      : 20,),
              ),
            ],
          ),
          Spacer(),
          if(MediaQuery
              .sizeOf(context)
              .width > 840) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 15,),
              Image.asset(
                'assets/images/pngegg (1).png',
                height: 50, width: 100,),
              SizedBox(width: 15,),
              Image.asset(
                'assets/images/pngegg.png', height: 50,
                width: 100,),
              SizedBox(width: 15,),
              Image.asset(
                'assets/images/pngegg (2).png',
                height: 80, width: 100,),
              SizedBox(width: 15,),

            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: MediaQuery
                      .sizeOf(context)
                      .width / 5,
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
                  width: MediaQuery
                      .sizeOf(context)
                      .width / 6,
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
    );
  }
}
