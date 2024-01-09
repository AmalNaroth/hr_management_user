import 'package:flutter/material.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/dashboard_screen.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/login/login_screen.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/splash/splash_screen.dart';

class AppRoutes{
  static const String splashScreen = "Splash-Screen";
  static const String dashBoardScreen = "DashBoard-Screen";
  static const String loginScreen = "Login-Screen";

  static Map<String,WidgetBuilder> get appRoute=>{
    splashScreen : (context) => const SplashScreen(),
    dashBoardScreen : (context) => const DashBoardScreen(),
    loginScreen :(context) => const LoginScreen()
  };
}