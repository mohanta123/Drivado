import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChange;

  const TabBarSection({
    required this.selectedTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.brown[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => onTabChange(0),
            child: Column(
              children: [
                Text(
                  'Users',
                  style: TextStyle(
                    color: selectedTab == 0 ? Colors.red : Colors.white,
                  ),
                ),
                if (selectedTab == 0)
                  Container(
                    height: 2,
                    width: 40,
                    color: Colors.red,
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onTabChange(1),
            child: Column(
              children: [
                Text(
                  'Sub - company',
                  style: TextStyle(
                    color: selectedTab == 1 ? Colors.red : Colors.white,
                  ),
                ),
                if (selectedTab == 1)
                  Container(
                    height: 2,
                    width: 40,
                    color: Colors.red,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}