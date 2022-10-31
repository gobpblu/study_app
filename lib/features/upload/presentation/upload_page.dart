import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/features/upload/controller/data_uploader.dart';

class UploadPage extends StatelessWidget {
  UploadPage({Key? key}) : super(key: key);

  FirebaseDataUploader dataUploader = Get.put(FirebaseDataUploader());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Uploading...'),
      ),
    );
  }
}
