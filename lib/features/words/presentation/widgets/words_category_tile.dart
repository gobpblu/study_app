import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';

class WordsCategoryTile extends StatelessWidget {
  const WordsCategoryTile({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

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
                  child: Image.asset(
                    'assets/images/words_categories_numbers.png',
                    width: 64,
                    height: 64,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Цифры 1-20', style: TextStyle(fontSize: 16),),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.stacked_bar_chart),
                          SizedBox(width: 4,),
                          Text('0/400'),
                        ],
                      ),
                    ],
                  ),)
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  color: onPrimaryColor, borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 24, top: 12),
              child: CircularProgressIndicator(
                value: 0.25,
                valueColor: AlwaysStoppedAnimation<Color>(secondaryTextColor),
                backgroundColor: primaryColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 40, top: 28),
            child: Text(
              '1/4',
              style: const TextStyle(
                color: secondaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
