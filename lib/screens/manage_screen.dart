import 'package:drivado/screens/userDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/manage_controller.dart';
import '../tabBarSection.dart';
import 'bookingScreen.dart';
import 'home_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  List<Widget> _screens = [
    HomeScreen(),
    BookingScreen(),
   // ManageScreen(),
    HomeScreen(),
    BookingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      floatingActionButton: Material(
        elevation: 8,
        shape: const CircleBorder(),
        color: Colors.transparent,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.pink,
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 70,
        child: Material(
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.12),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
                _buildNavItem(icon: Icons.book, label: 'Booking', index: 1),
                const SizedBox.shrink(), // Spacer for the FAB
                _buildNavItem(icon: Icons.manage_accounts_sharp, label: 'Manage', index: 2),
                _buildNavItem(icon: Icons.person, label: 'Profile', index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;

        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.pink : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

