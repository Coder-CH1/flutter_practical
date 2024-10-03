import 'package:assessment/auth_manager/auth_manager.dart';
import 'package:assessment/state_management/auth_bloc.dart';
import 'package:assessment/view/user_auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthManager(http.Client())),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignupScreen(),
        ),
    );
  }
}
