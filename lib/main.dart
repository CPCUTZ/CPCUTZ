import 'package:fixy_pro/modules/auth/create_account.dart';
import 'package:fixy_pro/modules/auth/login.dart';
import 'package:fixy_pro/modules/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FixyProApp());
}

class FixyProApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const CreateAccount(),
        '/homeScreen': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'FixyPro',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
