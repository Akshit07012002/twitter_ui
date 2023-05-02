import 'package:flutter/material.dart';
import 'package:twitter_ui/screens/bottomnavbar.dart';
import 'package:twitter_ui/screens/main_tabs/home/home.dart';
import 'package:twitter_ui/services/mongoConnect.dart';
import 'package:twitter_ui/screens/error.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await MongoDatabase.connect();
  } catch (e) {
    runApp(Error());
  } finally {
    runApp(const MyApp());
  }
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
