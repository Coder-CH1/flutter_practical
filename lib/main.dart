
import 'package:assessment/user_vehicle/single_vehicle_details_screen.dart';
import 'package:assessment/user_vehicle/vehicle_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VehicleListScreen(),
    );
  }
}
