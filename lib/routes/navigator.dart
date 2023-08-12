import 'package:flutter/material.dart';
import 'package:movie/routes/routes.dart';
import 'package:movie/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.SPLASH_SCREEN: (context) => const SplashScreen(),
      },
      initialRoute: Routes.SPLASH_SCREEN,
    );
  }
}
