import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/resources/string.dart';
import 'package:movie/screens/login/bloc/user_state.dart';
import 'package:movie/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Cubit<String> {
  UserBloc(): super(StringResources.login){
    initializeSharedPreference();
  }
  late final SharedPreferences prefs;

  void initializeSharedPreference() async{
    prefs = await SharedPreferences.getInstance();
  }
  
  void checkUserExistOrNot(String email) {
    if (email == prefs.get(LoginScreen.LOGIN_ID)) {
      emit(UserState.isExist());
    } else {
      emit(UserState.newUser());
    }
  }
}