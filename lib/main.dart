import 'package:flutter/material.dart';
import 'package:twitter_ui/screens/bottomnavbar.dart';
import 'package:twitter_ui/screens/main_tabs/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Twitter Segmented Clone',
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}