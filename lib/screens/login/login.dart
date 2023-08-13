import 'package:flutter/material.dart';
import 'package:movie/component/edit_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String LOGIN_ID = "LOGIN_ID";
  static const String LOGIN_PASSWORD = "LOGIN_PASSWORD";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isExistingUser = false;
  String? emailId;
  String? password;
  String btnText = 'Login';
  late final SharedPreferences prefs;

  void initializeSharedPreference() async{
    prefs = await SharedPreferences.getInstance();
  }

  void findUser() {
    String? emailId = prefs.getString(LoginScreen.LOGIN_ID);
    setState(() {
      isExistingUser = this.emailId != null && this.emailId == emailId;
      if (isExistingUser) {
        btnText = 'Login';
      } else {
        btnText = 'Register';
      }
    });
  }

  void loginRegisterBtnClicked() {
    if (emailId != null && password != null) {
      if (isExistingUser) {
        String? emailId = prefs.getString(LoginScreen.LOGIN_ID);
        String? password = prefs.getString(LoginScreen.LOGIN_PASSWORD);
        if (this.emailId == emailId && this.password == password) {

        }
      } else {
        prefs.setString(LoginScreen.LOGIN_ID, emailId!);
        prefs.setString(LoginScreen.LOGIN_PASSWORD, password!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeSharedPreference();
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
                      emailId = null;
                    } else {
                      emailId = value;
                    }
                    findUser();
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
                      password = null;
                    } else {
                      password = value;
                    }
                  }),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: loginRegisterBtnClicked,
                child: Text(
                  btnText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    final RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
