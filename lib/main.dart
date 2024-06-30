import 'dart:async';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midwest/data/firebase/config.dart';
import 'package:midwest/res/app_providers.dart';
import 'package:midwest/view/home/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
      options: FirebaseConfig.config
  );
  FastCachedImageConfig.init();
  Timer(const Duration(seconds: 2), () => FlutterNativeSplash.remove()
    ,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppProviders.providers,
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
