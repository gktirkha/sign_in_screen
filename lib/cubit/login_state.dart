part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class Error extends LoginState {
  Error({required this.message});
  final String message;
}

class LoggedIn extends LoginState {}
