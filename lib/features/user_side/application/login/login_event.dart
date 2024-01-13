part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginButtonClickEvent extends LoginEvent {
  String email;
  String password;
  LoginButtonClickEvent({required this.email, required this.password});
}
