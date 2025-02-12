import 'package:flutter/material.dart';

class BankBillsPage extends StatefulWidget {
  const BankBillsPage({super.key});

  @override
  State<BankBillsPage> createState() => _BankBillsPageState();
}

class _BankBillsPageState extends State<BankBillsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> insuranceData = [
    {
      'name': 'Health Insurance',
      'date': '20-01-2025',
      'amount': 'Rs.3500',
      'priority': 'high',
      'status': 'upcoming',
      'done': false,
    },
    {
      'name': 'Car Insurance',
      'date': '11-01-2025',
      'amount': 'Rs.1000',
      'priority': 'moderate',
      'status': 'past',
      'done': false,
    },
    {
      'name': 'Home Insurance',
      'date': '23-01-2025',
      'amount': 'Rs.2000',
      'priority': 'low',
      'status': 'live',
      'done': false,
    },
  ];

  Color getPriorityColor(String priority, bool done) {
    if (done) return const Color.fromARGB(255, 162, 243, 164);
    switch (priority) {
      case 'high':
        return const Color.fromARGB(255, 238, 135, 135);
      case 'moderate':
        return const Color.fromARGB(255, 240, 204, 107);
      case 'low':
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bank Bills",
          style: TextStyle(
            color: Colors.white,  // Title text color
            fontSize: 22,         // Title font size
            fontWeight: FontWeight.bold,  // Title font weight
          ),
        ),
        backgroundColor: Colors.blueGrey, // AppBar background color
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Live"),
            Tab(text: "Upcoming"),
            Tab(text: "Past"),
          ],
          indicatorColor: Colors.white, // Color of the tab indicator
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildInsuranceList('live'),
          buildInsuranceList('upcoming'),
          buildInsuranceList('past'),
        ],
      ),
    );
  }

  Widget buildInsuranceList(String status) {
    final filteredData = insuranceData.where((item) => item['status'] == status).toList();
    if (filteredData.isEmpty) {
      return const Center(child: Text("No Data Available"));
    }
    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final insurance = filteredData[index];
        return Card(
          color: getPriorityColor(insurance['priority'], insurance['done']),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              insurance['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Due Date: ${insurance['date']}"),
                Text("Amount: ${insurance['amount']}"),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  insurance['done'] = !insurance['done'];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: insurance['done'] ? const Color.fromARGB(255, 162, 243, 164) : Colors.white,
              ),
              child: Text(
                insurance['done'] ? "Done" : "Mark as Done",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
