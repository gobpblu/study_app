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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: Get.mediaQuery.size.width - 64,
            height: 80,
            decoration: BoxDecoration(
              color: onPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),

                  child: SvgPicture.asset(
                    iconAsset,
                    width: 64,
                    height: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 20),
                      ),
                      /*SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.stacked_bar_chart),
                          SizedBox(
                            width: 4,
                          ),
                          Text('0/400'),
                        ],
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  color: onPrimaryColor,
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 24, top: 12),
              child: CircularProgressIndicator(
                value: 1,
                valueColor: AlwaysStoppedAnimation<Color>(secondaryTextColor),
                backgroundColor: primaryColor,
              ),
            ),
          ),
          /*Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 40, top: 28),
            child: Text(
              // '1/4',
              style: const TextStyle(
                color: secondaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
