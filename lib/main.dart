import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_user/config/routes/app_routes.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/dependency_injection/dependency_injection.dart';
import 'package:hr_management_user/core/navigator_services/navigator_services.dart';
import 'package:hr_management_user/features/user_side/application/login/login_bloc.dart';
import 'package:hr_management_user/features/user_side/application/splash/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    mWidth = size.width;
    mHight = size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        navigatorKey: NavigatorService.navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        routes: AppRoutes.appRoute,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
