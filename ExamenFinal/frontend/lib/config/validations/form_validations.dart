import 'dart:convert';

import 'package:dio/dio.dart';
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

  static Future<void> login(BuildContext context) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        'http://localhost:3000/login',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          'username': _email,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        context.go('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
}