import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config/validations/form_validations.dart';
import 'package:frontend/presentation/providers/theme_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});
  static const String name = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final FormValidations validation = FormValidations();

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider).themeData;

    return Scaffold(
      body: Container(
        color: theme.appBarTheme.backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log in to Spotify',
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    icon: Icon(Icons.g_translate_rounded, color: Colors.white),
                    label: Text('Continue with Google'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    icon: Icon(Icons.facebook, color: Colors.white),
                    label: Text('Continue with Facebook'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    icon: Icon(Icons.apple, color: Colors.white),
                    label: Text('Continue with Apple'),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 350,
                    height: 1,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: validation.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email or username',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: validation.emailController,
                          decoration: InputDecoration(
                            hintText: 'Email or username',
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(73, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(126, 97, 97, 97),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) => FormValidations.validateEmailOrUsername(value),
                          onChanged: (value) => FormValidations.setEmail(value),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Password',
                          style: TextStyle(color:  theme.primaryColor),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: validation.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(73, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(126, 97, 97, 97),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validator: (value) => FormValidations.validatePassword(value),
                          onChanged: (value) => FormValidations.setPassword(value),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (validation.formKey.currentState!.validate()) {
                                FormValidations.login(context);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 55, 180, 59)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: Text(
                              'Log in',
                              style: const TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
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
