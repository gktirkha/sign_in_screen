import 'package:flutter/material.dart';

import 'routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<bool> showSign = ValueNotifier(false);
  Color scaffColor = const Color(0xff0042AA);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: scaffColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          onTap: () => showSign.value = !value,
                          child: Container(
                            color: Colors.white.withOpacity(.2),
                            height: mediaQueryData.size.height * .08,
                            child: Center(
                                child: Text(
                              value ? "Sign in" : "",
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showSign.value = !value,
                          child: Container(
                            color: Colors.white.withOpacity(.2),
                            height: mediaQueryData.size.height * .08,
                            child: Center(
                                child: Text(
                              !value ? "Sign up" : "",
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * .05),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: Text(
                      "Phone Number",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * .05),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
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
                      Navigator.pushNamed(context, RouteName.loggedInHome);
                    },
                    child: Text(value ? "Sign in" : "Sign Up"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
