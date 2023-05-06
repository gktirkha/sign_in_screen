import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sign_in_screen/cubit/login_cubit.dart';
import 'package:sign_in_screen/routes.dart';
import 'package:sign_in_screen/widgets/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<bool> showSign = ValueNotifier(false);
  Color scaffColor = const Color(0xff0042AA);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: scaffColor,
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is Loading) {
              showGeneralDialog(
                barrierDismissible: false,
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Container(
                  height: 200,
                  width: 100,
                  padding: const EdgeInsets.all(16),
                  child:
                      const Center(child: SpinKitCubeGrid(color: Colors.white)),
                ),
              );
            } else if (state is Error) {
              showGeneralDialog(
                barrierDismissible: false,
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Material(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(state.message),
                              VSizedBox(mediaQueryData: mediaQueryData),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RouteName.login, (route) => false);
                                },
                                child: const Text("Retry"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is LoggedIn) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.loggedInHome,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 32),
                          ),
                          TextSpan(
                            text: "to Sing in continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * .05),
                    ValueListenableBuilder(
                      valueListenable: showSign,
                      builder: (context, value, child) => Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {
                                if (!value) {showSign.value = true}
                              },
                              child: Container(
                                color: Colors.white.withOpacity(.2),
                                height: mediaQueryData.size.height * .08,
                                child: Center(
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color:
                                            value ? Colors.white : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {
                                if (value) {showSign.value = false}
                              },
                              child: Container(
                                color: Colors.white.withOpacity(.2),
                                height: mediaQueryData.size.height * .08,
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: !value
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * .05),
                    TextField(
                      controller: email,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        label: Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * .05),
                    TextField(
                      controller: password,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        label: Text(
                          "Password",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQueryData.size.height * .3,
                    ),
                    ValueListenableBuilder(
                      valueListenable: showSign,
                      builder: (context, value, child) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(mediaQueryData.size.width / 2, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: scaffColor),
                        onPressed: () {
                          context.read<LoginCubit>().login(
                                email.text,
                                password.text,
                              );
                        },
                        child: Text(value ? "Sign in" : "Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
