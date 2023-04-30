import 'package:flutter/material.dart';
import 'package:twitter_ui/screens/main_tabs/home/home_tabs/following.dart';
import 'package:twitter_ui/screens/main_tabs/home/home_tabs/for_you.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Container(
              color: Colors.white,
              child: const TabBar(
                dividerColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                physics: BouncingScrollPhysics(),
                tabs: [
                  Tab(
                    child: Text('For you'),
                  ),
                  Tab(
                    child: Text('Following'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.777,
              child: const TabBarView(
                children: [
                  ForYou(),
                  Following(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
