import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_ui/screens/main_tabs/home/home.dart';
import 'package:twitter_ui/screens/main_tabs/inbox/inbox.dart';
import 'package:twitter_ui/screens/main_tabs/notifications/notifications.dart';
import 'package:twitter_ui/screens/main_tabs/search/search.dart';

import '../screens/main_tabs/home/home_tabs/following.dart';
import '../screens/main_tabs/home/home_tabs/for_you.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> tabs = [
      const Home(),
      const Search(),
      const Notifications(),
      const Inbox(),
    ];

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: height * 0.12,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: CircleAvatar(
            child: FlutterLogo(
              size: width * 0.04,
            ),
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(width * 0.1),
          child: FlutterLogo(
            size: width * 0.04,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
            ),
            label: "Inbox",
          ),
        ],
      ),
      body: tabs[selectedIndex],
      // const TabBarView(
      //   children: [
      //     ForYou(),
      //     Following(),
      //   ],
      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
