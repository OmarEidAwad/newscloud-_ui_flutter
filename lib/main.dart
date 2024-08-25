import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/home_view.dart';
import 'package:news_app_ui_setup/views/onboardin_view.dart';
import 'package:news_app_ui_setup/views/setting_view.dart';
import 'package:news_app_ui_setup/views/team_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
//////////////////////////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////
///////////////////
///////////
///////
///

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int selectedindex = 0;

  List<Widget> listwidget = [HomeView(), TeamPage(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              selectedindex = i;
            });
          },
          currentIndex: selectedindex,
          backgroundColor: const Color.fromARGB(255, 246, 244, 244),
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          selectedFontSize: 20,
          unselectedFontSize: 14,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "our team"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "setting"),
          ]),
      body: Container(
        child: listwidget.elementAt(selectedindex),
      ),
    );
  }
}
