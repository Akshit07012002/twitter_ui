import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      resizeToAvoidBottomInset: false,
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
          child: const FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 28.0),
        backgroundColor: Colors.blue,
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.gif_box_outlined, color: Colors.blue),
            backgroundColor: Colors.white,
            onTap: () => print('Pressed Read Later'),
            labelWidget: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Text(
                "Gif",
                style: TextStyle(color: Colors.black, fontSize: width * 0.05),
              ),
            ),
          ),
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.image,
              color: Colors.blue,
              size: width * 0.05,
            ),
            backgroundColor: Colors.white,
            onTap: () => print('Pressed Write'),

            labelWidget: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Text(
                "Photos",
                style: TextStyle(color: Colors.black, fontSize: width * 0.05),
              ),
            ),
            // labelBackgroundColor: Colors.transparent,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? const FaIcon(FontAwesomeIcons.houseChimneyWindow)
                : const FaIcon(FontAwesomeIcons.houseChimneyWindow),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? const FaIcon(FontAwesomeIcons.solidBell)
                : const FaIcon(FontAwesomeIcons.bell),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? const FaIcon(FontAwesomeIcons.solidEnvelope)
                : const FaIcon(FontAwesomeIcons.envelope),
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
