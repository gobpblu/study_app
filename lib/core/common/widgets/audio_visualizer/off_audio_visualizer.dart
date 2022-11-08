import 'package:flutter/material.dart';
import 'package:study_app/core/res/app_colors.dart';

class OffAudioVisualizer extends StatelessWidget {
  const OffAudioVisualizer({Key? key}) : super(key: key);

  final List<Color> colors = const [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent,
  ];
  final List<int> duration = const [500, 400, 600, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        10,
        (index) => Container(
          width: 10,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 10,
        ),
      ),
    );
  }
}
