import 'package:calisthenics/screens/complete_profile/complete_profile_screen.dart';
import 'package:calisthenics/screens/forgot_password/forgot_password_screen.dart';
import 'package:calisthenics/screens/home/home_screen.dart';
import 'package:calisthenics/screens/login_success/login_success_screen.dart';
import 'package:calisthenics/screens/otp/otp_screen.dart';
import 'package:calisthenics/screens/sign_in/sign_in_screen.dart';
import 'package:calisthenics/screens/sign_in/sign_up/sign_up_screen.dart';
import 'package:calisthenics/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
