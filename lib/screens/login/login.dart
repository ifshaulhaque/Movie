import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie/resources/string.dart';
import 'package:movie/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String LOGIN_ID = "LOGIN_ID";
  static const String LOGIN_PASSWORD = "LOGIN_PASSWORD";
  static const String IS_LOGGED_IN = "IS_LOGGED_IN";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isExistingUser = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String btnText = StringResources.login;
  late final SharedPreferences prefs;
  final _formKey = GlobalKey<FormState>();

  void initializeSharedPreference() async{
    prefs = await SharedPreferences.getInstance();
  }

  void login() {
    prefs.setBool(LoginScreen.IS_LOGGED_IN, true);
    Navigator.pushReplacementNamed(context, Routes.MOVIE_LIST_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    initializeSharedPreference();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: StringResources.emailId,
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    return isEmailValid(value!) ? null : StringResources.invalidEmail;
                  },
                  onChanged: (String? value) {
                    if (isEmailValid(value!)) {
                      if (value == prefs.get(LoginScreen.LOGIN_ID)) {
                        btnText = StringResources.login;
                      } else {
                        btnText = StringResources.register;
                      }
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: StringResources.password,
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    return value!.length >= 6 ? null : StringResources.invalidPassword;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (emailController.value.text == prefs.get(LoginScreen.LOGIN_ID)) {
                        if (passwordController.value.text == prefs.getString(LoginScreen.LOGIN_PASSWORD)) {
                          login();
                        } else {
                          Fluttertoast.showToast(
                            msg: StringResources.wrongPassword,
                            backgroundColor: Colors.redAccent
                          );
                        }
                      } else {
                        prefs.setString(LoginScreen.LOGIN_ID, emailController.value.text);
                        prefs.setString(LoginScreen.LOGIN_PASSWORD, passwordController.value.text);
                        login();
                      }
                    }
                  },
                  child: Text(
                    btnText,
                  ),
                )
              ],
            ),
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
