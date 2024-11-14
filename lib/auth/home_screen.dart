import '/home/location_screen.dart';
import '/home/notifications_screen.dart';

import '/home/home_work_screen.dart';
import '/home/profile_screen.dart';
import '/home/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard'),
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
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            _buildDrawerItem(Icons.home, 'Dashboard'),
            _buildDrawerItem(Icons.history, 'Trip History'),
            _buildDrawerItem(Icons.payment, 'Payments'),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _buildDrawerItem(Icons.settings, 'Profile Settings'),
            _buildDrawerItem(Icons.support, 'Support'),
            _buildDrawerItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 75.0),
          child: Center(
            child: _buildCurrentScreen(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        tooltip: 'Add',
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
          Icon(Icons.directions_car, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.home_work, size: 30, color: Colors.white),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          
          Widget screen;
          switch (index) {
            case 0:
              screen =  LocationScreen();
              break;
            case 1:
              screen =  LocationScreen();
              break;
            case 2:
              screen = const HomeWorkScreen();
              break;
            case 3:
              screen = const NotificationScreen();
              break;
            case 4:
              screen = const ProfileScreen();
              break;
            default:
              return;
          }

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => screen,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(position: offsetAnimation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 300),
            ),
          );
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
        // Add navigation logic here if needed
      },
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return const Center(child: Text('CarScreen'));
      case 1:
        return const Center(child: Text('List Screen'));
      case 2:
        return const Center(child: Text('Home Work Screen'));
      case 3:
        return const Center(child: Text('Notifications Screen'));
      case 4:
        return const Center(child: Text('Profile Screen'));
      default:
        return const Center(child: Text('CarScreen'));
    }
  }
}