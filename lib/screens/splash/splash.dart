import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Image.asset(
              'assets/images/film-slate.png',
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
