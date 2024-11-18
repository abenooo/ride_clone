import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../home/wallet_screen.dart';
import '../home/location_screen.dart';
import '../home/chat_screen.dart';
import '../home/notifications_screen.dart';
import '../home/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const CarScreen(),
    const LocationScreen(),
    const HomeWorkScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = [
    'Car Screen',
    'Location Screen',
    'Home Work Screen',
    'Notifications',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: false,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Professional Driver'),
              accountEmail: Text('driver@example.com'),
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage('asset/auth/profile.jpg'),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            _buildDrawerItem(Icons.history, 'History'),
            _buildDrawerItem(Icons.report, 'Complain'),
            _buildDrawerItem(Icons.share, 'Referral'),
            _buildDrawerItem(Icons.payment, 'Payment'),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _buildDrawerItem(Icons.settings, 'Profile Settings'),
            _buildDrawerItem(Icons.support, 'Help and Support'),
            _buildDrawerItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
      body: _screens[_currentIndex], // Dynamically load the selected screen
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        tooltip: 'Chat',
        elevation: 2.0,
        child: const Icon(Icons.chat),
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        backgroundColor: Colors.transparent,
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOutCubic,
        items: const <Widget>[
          Icon(Icons.wallet, size: 30, color: Colors.white),
          Icon(Icons.map, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        // Additional navigation logic can go here if needed
      },
    );
  }
}
