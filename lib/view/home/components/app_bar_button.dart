
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key, this.onTap, required this.title, this.textStyle});
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap??(){},
        child: Text(
          title,
          style:textStyle?? TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.sizeOf(context).width>890? 13:11),
        ),
      ),
    );
  }
}
