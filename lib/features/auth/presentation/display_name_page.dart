import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/common/widgets/action_button.dart';
import 'package:study_app/features/auth/bloc/auth_bloc.dart';

import '../../../core/res/fonts.dart';

class DisplayNamePage extends StatelessWidget {
  const DisplayNamePage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ActionButton(
        onPressed: () {
          context.read<AuthBloc>().add(UpdateUsername(user: user));
        },
      ),
      appBar: AppBar(
        title: Text(
          'auth_title'.tr,
          style: TextStyle(fontFamily: playfairDisplay, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'auth_username'.tr),
            onChanged: (text) {
              context.read<AuthBloc>().add(UsernameChanged(username: text));
            },
          ),
        ],
      ),
    );
  }
}
