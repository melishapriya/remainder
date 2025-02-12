import 'package:flutter/material.dart';

class ElectricityPage extends StatelessWidget {
  const ElectricityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Electricity Bills")),
      body: const Center(
        child: Text(
          "Pay your electricity bills easily.",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
