import 'package:fixy_pro/modules/screen/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar a MainMenuScreen al seleccionar el primer elemento
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainMenuScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveNavigationBar(
      selectedIndex: _selectedIndex,
      onTabChange: changeTab,
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      navigationBarButtons: const <NavigationBarButton>[
        NavigationBarButton(
          text: 'Tab 1',
          icon: Icons.people,
          backgroundGradient: LinearGradient(
            colors: [Colors.yellow, Colors.green, Colors.blue],
          ),
        ),
        NavigationBarButton(
          text: 'Tab 2',
          icon: Icons.star,
          backgroundGradient: LinearGradient(
            colors: [Colors.cyan, Colors.teal],
          ),
        ),
        NavigationBarButton(
          text: 'Tab 3',
          icon: Icons.settings,
          backgroundGradient: LinearGradient(
            colors: [Colors.green, Colors.yellow],
          ),
        ),
      ],
    );
  }
}
