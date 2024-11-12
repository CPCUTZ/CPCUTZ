import 'package:fixy_pro/modules/screen/home_screen.dart';
import 'package:fixy_pro/modules/screen/main_menu_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String mainMenu = '/mainMenu';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case mainMenu:
        return MaterialPageRoute(builder: (_) => MainMenuScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
