import 'package:flutter/material.dart';
import 'package:pawfront/nightstay_screen.dart';

void main() {
  runApp(const NightStayApp());
}

class NightStayApp extends StatelessWidget {
  const NightStayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NightStayScreen(),
    );
  }
}

