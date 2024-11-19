import 'package:drivado/screens/sub_company.dart';
import 'package:drivado/screens/userDetailsScreen.dart';
import 'package:drivado/screens/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/manage_controller.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ManageController controller = Get.put(ManageController());
  int selectedTab = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0,
        toolbarHeight: 120,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://example.com/profile-image.jpg'),
            ),
            SizedBox(height: 8),
            Text('Test Drivado',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Text('test@drivado.com',
                style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          /// Search Bar
          Container(
            color: Colors.brown[900],
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          /// Tab Bar
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabItem(
                  title: 'Users',
                  index: 0,
                ),
                _buildTabItem(
                  title: 'Sub-company',
                  index: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedTab,
              children: [
            /// Users Tab
            const UserScreen(),

            /// Sub-company Tab
            SubCompany()
            ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          selectedTab = index;
        }),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: isSelected
                  ? [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ]
                  : [],
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


