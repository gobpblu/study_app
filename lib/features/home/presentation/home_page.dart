import 'package:flutter/material.dart';
import 'package:study_app/features/dialogs/presentation/dialogs_page.dart';
import 'package:study_app/features/texts/presentation/texts_page.dart';
import 'package:study_app/features/words/presentation/words_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  List pages = [
    WordsPage(),
    WordsPage(),
    TextsPage(),
    DialogsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.wordpress), label: 'WORDS'),
          BottomNavigationBarItem(icon: Icon(Icons.wordpress), label: 'WORDS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.back_hand_outlined), label: 'TEXTS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.textsms_outlined), label: 'DIALOGS'),
        ],
        currentIndex: bottomNavIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
