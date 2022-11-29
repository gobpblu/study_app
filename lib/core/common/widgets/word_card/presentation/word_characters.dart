import 'package:flutter/material.dart';

class WordCharacters extends StatelessWidget {
  const WordCharacters({
    Key? key,
    required this.word,
    required this.characters,
    required this.onTap,
  }) : super(key: key);

  final List<String> word;
  final List<String> characters;
  final Function(String, int) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: _generateCharacters(characters));
  }

  List<Widget> _generateCharacters(List<String> characters) {
    List<Widget> charactersWidgets = [];
    for (int i = 0; i < characters.length; i++) {
      if (characters[i].isEmpty) {
        charactersWidgets.add(const SizedBox(width: 80, height: 80));
      } else {
        charactersWidgets.add(SizedBox(
          width: 80,
          height: 80,
          child: GestureDetector(
            onTap: () {
              onTap.call(characters[i], i);
            },
            child: Card(
              margin: EdgeInsets.all(16),
              elevation: 10,
              child: Text(
                characters[i],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 36),
              ),
            ),
          ),
        ));
      }
    }
    return charactersWidgets;
  }
}
