import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('auth_log_in'.tr)),
      body: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('auth_log_in_to_save'.tr),
        FloatingActionButton(
            backgroundColor: Colors.white38,
            foregroundColor: Colors.black87,
            onPressed: () {
              context.read<AuthBloc>().add(SignInWithGoogle());
            }),
      ],
    );
  }
}
