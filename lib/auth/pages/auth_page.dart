import 'package:flutter/material.dart';
import 'package:thoughts/auth/pages/login.dart';
import 'package:thoughts/auth/pages/register.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool login = true;
  void toggleScreens() {
    setState(() {
      login = !login;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (login) {
      return Login(
        register: toggleScreens,
      );
    } else {
      return Register(
        login: toggleScreens,
      );
    }
  }
}
