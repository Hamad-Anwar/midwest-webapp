import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
   VideoSection({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:constraints.maxWidth>700 ? 100: 50),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.7,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20,right: 20,
            bottom:  constraints.maxWidth > 600 ?0:20
            ),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.07),
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.red,
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
