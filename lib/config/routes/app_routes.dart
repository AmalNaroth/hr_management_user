import 'package:flutter/material.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/attendnce/attendnce_screen.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/leave/leave_screen.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/login/login_screen.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/profile/user_profile.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/splash/splash_screen.dart';

class AppRoutes{
  static const String splashScreen = "Splash-Screen";
  static const String dashBoardScreen = "DashBoard-Screen";
  static const String loginScreen = "Login-Screen";
  static const String attendence = 'Attendence-Screen';
  static const String leaveScreen = 'Leave-Screen';
  static const String userProfile = 'User-Profile';

  static Map<String,WidgetBuilder> get appRoute=>{
    splashScreen : (context) => const SplashScreen(),
    dashBoardScreen : (context) =>  DashBoardScreen(),
    loginScreen :(context) => const LoginScreen(),
    attendence : (context) =>  const AttendenceScreen(),
    leaveScreen :(context) => const LeaveScreen(),
    userProfile :(context) => const UserProfile()
  };
}