import 'package:flutter/material.dart';
import 'package:food_app/configs/theme.dart';
import 'package:food_app/screens/Bag/bag_screen.dart';
import 'package:food_app/screens/Home/home_screen.dart';
import 'package:food_app/widgets/custom_text.dart';
import 'package:food_app/widgets/notification_icon.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    HomeScreen(),
    BagScreen(),
    HomeScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: CustomText(
          text: "FoodApp",
          color: white,
          size: 18,
        ),
        actions: [
          CustomNotificationIcon(),
        ],
      ),
      body: SafeArea(child: _pages[_selectedPageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city_rounded), label: "NearBy"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Bag"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
