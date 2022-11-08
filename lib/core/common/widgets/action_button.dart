import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          onPressed?.call();
        },
        /*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),*/
        /*elevation: 0,
              tooltip: 'button_change'.tr,*/
        child: Text('button_change'.tr,),
      ),
    );
  }
}
