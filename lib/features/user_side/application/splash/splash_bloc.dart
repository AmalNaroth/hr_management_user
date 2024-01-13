import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_management_user/config/routes/app_routes.dart';
import 'package:hr_management_user/core/navigator_services/navigator_services.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>((event, emit) async {
      await Future.delayed(
        const Duration(seconds: 5),
      );
     if(FirebaseAuth.instance.currentUser!=null){
       NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashBoardScreen  );
     }else{
       NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
     }
    });
  }
}
