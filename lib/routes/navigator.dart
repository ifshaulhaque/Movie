import 'package:flutter/material.dart';
import 'package:movie/routes/routes.dart';
import 'package:movie/screens/login/login.dart';
import 'package:movie/screens/movies/movie_list.dart';
import 'package:movie/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.SPLASH_SCREEN: (context) => SplashScreen(),
        Routes.LOGIN_SCREEN: (context) => const LoginScreen(),
        Routes.MOVIE_LIST_SCREEN: (context) => const MovieListScreen(),
      },
      initialRoute: Routes.SPLASH_SCREEN,
    );
  }
}
