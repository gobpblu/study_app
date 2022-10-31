import 'package:flutter/material.dart';
import 'package:study_app/core/res/styles/text_styles.dart';

import '../models/english_dialog.dart';

class DialogContentPage extends StatelessWidget {
  const DialogContentPage({Key? key, required this.dialog}) : super(key: key);

  final EnglishDialog dialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white38,
        title: Text(dialog.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(dialog.content.replaceAll('.', '.\n').replaceAll('?', '?\n'), style: contentPageTextStyle,),
      ),
    );
  }
}
