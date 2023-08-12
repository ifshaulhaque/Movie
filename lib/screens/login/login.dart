import 'package:flutter/material.dart';
import 'package:movie/component/edit_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EditText(
                  hintText: 'Email Id',
                  onChange: (value, errorCallback) {
                    if (!isEmailValid(value)) {
                      errorCallback("invalid email id");
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
              EditText(
                  hintText: 'Password',
                  obsecureText: true,
                  onChange: (value, errorCallback) {
                    if (value.length < 6) {
                      errorCallback("Minimum 6 digit required");
                    }
                  }),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Login',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isEmailValid(String email) {
  final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}
