// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutter/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onSignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.brightBlue,
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (err) {
      Navigator.pop(context);
      wrongField(err.code);
    }
  }

  void wrongField(String errCode) {
    String message;
    switch (errCode) {
      case "user-not-found":
        message = "Incorrect email";
        break;
      case "wrong-password":
        message = "Incorrect password";
        break;
      default:
        message = "Unkown error";
        break;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            // FONDO "R"
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Opacity(
                opacity: 1,
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Column(
                  children: [
                    TextField(
                      // CORREO
                      style: const TextStyle(color: AppColors.white),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: AppColors.white),
                        hintText: 'example@usm.cl',
                        hintStyle: const TextStyle(color: AppColors.grey),
                        filled: true,
                        fillColor: AppColors.grey60,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      // CONTRASEÑA
                      style: const TextStyle(color: AppColors.white),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: AppColors.white),
                        hintText: 'Insert your password',
                        hintStyle: const TextStyle(color: AppColors.grey),
                        filled: true,
                        fillColor: AppColors.grey60,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Align(
                      // "Forgot your password?"
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO lógica para recuperar contraseña
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(color: AppColors.white150),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      // SIGN IN
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          onSignIn();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // "or"
                    const Text(
                      'or',
                      style: TextStyle(color: AppColors.white150),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      // OUTLOOK
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: SvgPicture.asset(
                          'assets/outlook.svg',
                          width: 24,
                          height: 24,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.brightBlue, // Color del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // TODO Lógica de autenticación con Outlook
                        },
                        label: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Outlook',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'PORTALS ©',
                  style: TextStyle(color: AppColors.white150),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
