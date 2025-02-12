import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> services = const [
    {'name': 'Insurance', 'icon': Icons.health_and_safety, 'route': '/insurance'},
    {'name': 'Electricity Bills', 'icon': Icons.electrical_services, 'route': '/electricity'},
    {'name': 'Fastag Recharge', 'icon': Icons.local_gas_station, 'route': '/fastag'},
    {'name': 'Network Bills', 'icon': Icons.network_check, 'route': '/network'},
    {'name': 'Home Bills', 'icon': Icons.home, 'route': '/homebills'},
    {'name': 'Bank Bills', 'icon': Icons.account_balance, 'route': '/bankbills'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text("Reminder"),
  centerTitle: true,
  leading: IconButton(
    icon: const Icon(Icons.person),
    onPressed: () {
      Navigator.pushNamed(context, '/profile');
    },
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, services[index]['route']);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(services[index]['icon'], size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      services[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
