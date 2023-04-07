import 'package:get/get.dart';

enum LoginMethod { login, register }

class AuthController extends GetxController {
  LoginMethod loginMethod = LoginMethod.register;
  bool rememberMe = false;
  bool isTermsAndConditions = false;

  changeTermsAndConditions(bool? value){
    isTermsAndConditions = value??false;
    update();
  }

  changeRememberMe(bool? value){
    rememberMe = value??false;
    update();
  }

  changeLoginMethod(LoginMethod method) {
    loginMethod = method;
    update();
  }
}
