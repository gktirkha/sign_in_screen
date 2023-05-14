part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  final bool isLoading;
  const LoginState({required this.isLoading});
}

class LoginInitial extends LoginState {
  const LoginInitial({required super.isLoading});
}

class Error extends LoginState {
  const Error({required this.message, required super.isLoading});
  final String message;
}

class LoggedIn extends LoginState {
  const LoggedIn({required super.isLoading});
}
