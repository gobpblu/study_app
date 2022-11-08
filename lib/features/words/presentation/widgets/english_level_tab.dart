import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_app/core/res/app_colors.dart';

class EnglishLevelTab extends StatelessWidget {
  const EnglishLevelTab({
    Key? key,
    required this.mainName,
    required this.secondaryName,
  }) : super(key: key);

  final String mainName;
  final String secondaryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 250,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              mainName,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          /*Align(
            child: Text(
              secondaryName,
              style: const TextStyle(
                fontSize: 72,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
