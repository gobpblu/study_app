import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';

class WordTopicTile extends StatelessWidget {
  const WordTopicTile({
    Key? key,
    required this.onTap,
    required this.iconAsset,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String iconAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: EdgeInsets.all(4),
        height: 80,
        decoration: BoxDecoration(
          color: onPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: iconAsset.contains('.svg')
                    ? SvgPicture.asset(
                        iconAsset,
                        width: 64,
                        height: 64,
                      )
                    : Image.asset(
                        iconAsset,
                        width: 64,
                        height: 64,
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
