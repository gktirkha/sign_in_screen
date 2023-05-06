import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(Loading());
    try {
      http.Response res = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          "email": email,
          "password": password,
        },
      );

      log(res.statusCode.toString());
      if (res.statusCode == 400) {
        throw Exception("Invalid Email ID or Password");
      }

      if (res.statusCode != 200) {
        throw Exception("Failed to login");
      }

      emit(LoggedIn());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
