import 'package:flutter/material.dart';
import 'package:movie/routes/routes.dart';
import 'package:movie/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  late final SharedPreferences prefs;

  void initializeSharedPreference() async{
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    initializeSharedPreference();
    runAfter3Seconds(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/film-slate.png',
            width: 150,
          ),
        ),
      ),
    );
  }

  Future<void> runAfter3Seconds(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () {
      bool isLoggedIn = prefs.getBool(LoginScreen.IS_LOGGED_IN) ?? false;

      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.MOVIE_LIST_SCREEN);
      } else {
        Navigator.pushReplacementNamed(context, Routes.LOGIN_SCREEN);
      }
    });
  }
}

