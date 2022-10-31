import 'package:flutter/material.dart';

class WordCardsPage extends StatelessWidget {
  const WordCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Карточки'),
        actions: [
          Text('1/20'),
        ],
      ),
      body: Column(

      ),
    );
  }
}
