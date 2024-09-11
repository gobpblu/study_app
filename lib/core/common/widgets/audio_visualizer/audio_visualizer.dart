import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/collect_listened_word/presentation/bloc/collect_listened_word_cubit.dart';

class AudioVisualizer extends StatelessWidget {
  const AudioVisualizer({Key? key, required this.shouldAnimate})
      : super(key: key);

  final bool shouldAnimate;

  final List<Color> colors = const [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent,
  ];
  final List<int> duration = const [500, 400, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
          10,
          (index) => _VisualComponent(
                color: colors[index % 4],
                duration: duration[index % 5],
                shouldAnimate: shouldAnimate,
              )),
    );
  }
}

class _VisualComponent extends StatefulWidget {
  const _VisualComponent({
    Key? key,
    required this.color,
    required this.duration,
    required this.shouldAnimate,
  }) : super(key: key);

  final bool shouldAnimate;
  final int duration;
  final Color color;

  @override
  State<_VisualComponent> createState() => _VisualComponentState();
}

class _VisualComponentState extends State<_VisualComponent>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeInSine);
    animation = Tween<double>(begin: 0, end: 70).animate(curvedAnimation)
      ..addListener(() => setState(() {}));
    // animController.repeat(reverse: true);
    // animController.repeat(period: Duration(seconds: 3));
    if (context.read<CollectListenedWordCubit>().state.shouldAnimate) {
      animController.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: animation.value,
    );
  }

  void turnOn() => animController.repeat(reverse: true);

  void turnOff() => animController.stop();

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
