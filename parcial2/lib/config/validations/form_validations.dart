import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormValidations {
  static late String _email;
  static late String _password;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static void setEmail(String email) {
    _email = email;
  }

  static void setPassword(String password) {
    _password = password;
  }

  static String? validateEmailOrUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or username';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static void login(BuildContext context) {
    if ((_email == "usuario" || _email == "usuario@gmail.com") &&
        _password == "123456") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inicio de sesión exitoso'),
        ),
      );
      context.go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}