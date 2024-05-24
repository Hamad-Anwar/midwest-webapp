import 'dart:async';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midwest/view/home/home_page.dart';
import 'package:midwest/view/register_team/register_team.dart';
import 'package:midwest/view/robowar/robowar.dart';
import 'package:midwest/view_model/controller/buy_ticket_controller.dart';
import 'package:midwest/view_model/controller/gallary_controller.dart';
import 'package:midwest/view_model/controller/home_controller.dart';
import 'package:midwest/view_model/controller/register_team_controller.dart';
import 'package:midwest/view_model/controller/robowar_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA8IBfjd9ZjqYpOUkJDTd5A95tSmozCUWU",
          authDomain: "midwest-20922.firebaseapp.com",
          projectId: "midwest-20922",
          storageBucket: "midwest-20922.appspot.com",
          messagingSenderId: "405444003726",
          appId: "1:405444003726:web:9de99b0f044fb8c16f46df",
          measurementId: "G-H1LQDYSFNJ"));
  FastCachedImageConfig.init();
  Timer(Duration(seconds: 2), () => FlutterNativeSplash.remove()
    ,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeController(),
          ),
          ChangeNotifierProvider(
            create: (context) => GalleryController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BuyTicketController(),
          ),
          ChangeNotifierProvider(
            create: (context) => RegisterTeamController(),
          ),
          ChangeNotifierProvider(
            create: (context) => RoboWarController(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Midwest',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: GoogleFonts.martelSansTextTheme().copyWith(
              ).apply(
                fontFamily: 'BrakeDisc',
              )
          ),
          home: HomePage(),
        ));
  }
}
