import 'package:flutter/material.dart';
import 'package:remainder_app/pages/budget_page.dart';
import 'package:remainder_app/pages/home_page.dart';
import 'package:remainder_app/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),  // Make sure HomePage is your starting point
      routes: {
        '/profile': (context) => const ProfilePage(),
        '/budget': (context) => const BudgetPage(), // Define the budget route here
      },
    );
  }
}
