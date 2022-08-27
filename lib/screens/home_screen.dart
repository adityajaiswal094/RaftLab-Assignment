import 'package:flutter/material.dart';
import 'package:raftlab_assignment/tabs/tab2.dart';
import 'package:raftlab_assignment/tabs/tab3.dart';
import 'package:raftlab_assignment/tabs/tab4.dart';
import '../tabs/tab1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  final _screens = const [
    FetchApiData(),
    SearchScreen(),
    WelcomeScreen(),
    WebViewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'My Flutter App',
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedFontSize: 15.0,
        selectedFontSize: 15.0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black45,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined), label: 'Welcome'),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: 'WebView'),
        ],
      ),
    );
  }
}
