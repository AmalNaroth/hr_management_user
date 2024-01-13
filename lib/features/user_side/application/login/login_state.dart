part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadignState extends LoginState{}

final class LoginErrorState extends LoginState{
  String errorMessage;
 LoginErrorState({required this.errorMessage}); 
}

final class LoginSuccessState extends LoginState{
  String successMessage;
  LoginSuccessState({required this.successMessage});
}