import 'package:flutter/material.dart';
import 'package:movie/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
}

Future<void> runAfter3Seconds(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, Routes.LOGIN_SCREEN);
  });
}

