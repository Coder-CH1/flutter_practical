import 'package:assessment/auth_manager/auth_provider.dart';
import 'package:assessment/view/user_auth/signup_screen.dart';
import 'package:assessment/view/user_vehicle/add_vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Auth(),
      ),
    );
  }
}

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider> (context);

    if (authProvider.isLoggedIn) {
      return const AddVehicleScreen();
    } else {
      return const SignupScreen();
    }
  }
}