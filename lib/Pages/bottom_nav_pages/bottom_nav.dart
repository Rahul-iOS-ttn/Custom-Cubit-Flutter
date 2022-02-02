import 'package:flutter/material.dart';
import './chart_page.dart';
import './home_page.dart';
import './my_page.dart';
import './search_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<BottomNav> {

  List pages = [
    HomePage(),
    AnalyticsPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex = 0;

  void onBarItemTap(int idx) {
    setState(() {
      currentIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onBarItemTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home", backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: "Bar", backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search", backgroundColor: Colors.white,),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me", backgroundColor: Colors.white,),
        ],
      ),
    );
  }
}