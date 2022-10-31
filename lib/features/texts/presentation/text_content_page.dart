import 'package:flutter/material.dart';
import 'package:study_app/core/res/styles/text_styles.dart';

import '../models/text.dart';

class TextContentPage extends StatelessWidget {
  const TextContentPage({Key? key, required this.text}) : super(key: key);

  final EnglishText text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white38,
        title: Text(text.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: Text(
          text.content, style: contentPageTextStyle,
        )),
      ),
    );
  }
}
