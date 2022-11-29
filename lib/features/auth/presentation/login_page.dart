import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('auth_log_in'.tr)),
        body: const _LoginBody(),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('auth_log_in_to_save'.tr, textAlign: TextAlign.center,),
          SizedBox(height: 24,),
          Container(
            width: 128,
            child: ElevatedButton(
                child: Text('Войти'),
                onPressed: () {
                  context.read<AuthBloc>().add(SignInWithGoogle());
                }),
          ),
        ],
      ),
    );
  }
}
