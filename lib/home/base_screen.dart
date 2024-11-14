import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'car_screen.dart';
import 'notifications_screen.dart';
import 'home_work_screen.dart';
import 'list_screen.dart';
import 'profile_screen.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;

  const BaseScreen({
    super.key,
    required this.body,
    required this.currentIndex,
  }) : super();

  @override
  Widget build(BuildContext context) {
    // Get the screen size for proper spacing
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white, // Set a background color to avoid the red screen
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: false,
        backgroundColor: Colors.green, // Match the navigation bar color
        elevation: 0, // Remove shadow
      ),
      drawer: _buildDrawer(context),
      body: Container(
        height: screenHeight,
        color: Colors.white, // Background color for the body
        child: Padding(
          padding: EdgeInsets.only(bottom: 75 + bottomPadding), // Adjust padding for curved nav bar
          child: body,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: _buildCurvedNavigationBar(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
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
          _buildDrawerItem(context, Icons.home, 'Dashboard'),
          _buildDrawerItem(context, Icons.history, 'Trip History'),
          _buildDrawerItem(context, Icons.payment, 'Payments'),
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          _buildDrawerItem(context, Icons.settings, 'Profile Settings'),
          _buildDrawerItem(context, Icons.support, 'Support'),
          _buildDrawerItem(context, Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildCurvedNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      child: CurvedNavigationBar(
        index: currentIndex,
        height: 60.0,
        items: const [
          Icon(Icons.directions_car, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.notifications, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOutCubic,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          if (index == currentIndex) return;
          
          Widget screen;
          switch (index) {
            case 0:
              screen = const CarScreen();
              break;
            case 1:
              screen = const ListScreen();
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
          
          if (screen != null) {
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
          }
        },
      ),
    );
  }
}