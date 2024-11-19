import 'package:flutter/material.dart';

void main() => runApp(const HistoryApp());

class HistoryApp extends StatelessWidget {
  const HistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HistoryScreen(),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Data for the tabs
  final List<Map<String, String>> completedEntries = [
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Kena", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Mulisa", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Kena", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Mulisa", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Kena", "car": "Mustang Shelby GT", "status": "Done"},
    {"name": "Mulisa", "car": "Mustang Shelby GT", "status": "Done"},
  ];

  final List<Map<String, String>> cancelledEntries = [
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Kena", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Mulisa", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Kena", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Mulisa", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Kena", "car": "Mustang Shelby GT", "status": "Cancelled"},
    {"name": "Mulisa", "car": "Mustang Shelby GT", "status": "Cancelled"},
  ];

  final List<Map<String, String>> upcomingEntries = [
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Today at 09:20 am"},
    {
      "name": "Kena",
      "car": "Mustang Shelby GT",
      "status": "Today at 02:00 pm"
    },
    {
      "name": "Mulisa",
      "car": "Mustang Shelby GT",
      "status": "Tomorrow at 11:30 am"
    },
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Today at 09:20 am"},
    {
      "name": "Henry",
      "car": "Mustang Shelby GT",
      "status": "Today at 02:00 pm"
    },
    {
      "name": "Mulisa",
      "car": "Mustang Shelby GT",
      "status": "Tomorrow at 11:30 am"
    },
    {"name": "Abenezer", "car": "Mustang Shelby GT", "status": "Today at 09:20 am"},
    {
      "name": "Henry",
      "car": "Mustang Shelby GT",
      "status": "Today at 02:00 pm"
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "History",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Completed"),
            Tab(text: "Cancelled"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(upcomingEntries, Colors.blueAccent, Colors.blueAccent),
          _buildList(completedEntries, Colors.green, Colors.green),
          _buildList(cancelledEntries, Colors.red, Colors.red),
        ],
      ),
    );
  }

  Widget _buildList(
      List<Map<String, String>> entries, Color borderColor, Color textColor) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    entry["car"]!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Text(
                entry["status"]!,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
