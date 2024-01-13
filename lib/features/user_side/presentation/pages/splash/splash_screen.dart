import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_user/features/user_side/application/splash/splash_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashBloc>().add(
          SplashInitialEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LottieBuilder.asset(
            "assets/animation/Animation - 1704790885409.json",
            fit: BoxFit.cover,
            delegates: LottieDelegates(
                values: [ValueDelegate.color([], value: Colors.black)]),
          ),
        ],
      ),
    );
  }
}
