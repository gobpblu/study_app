import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/features/auth/tree/login_and_password/presentation/screen/login_and_password_page.dart';
import 'package:study_app/generated/l10n.dart';

import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).auth_log_in)),
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
          Text(
            S.of(context).auth_log_in_to_save,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 128,
            child: ElevatedButton(
                child: Text(S.of(context).sign_in_with_gogle),
                onPressed: () {
                  context.read<AuthBloc>().add(SignInWithGoogle());
                }),
          ),
          Container(
            // width: 128,
            child: ElevatedButton(
                child: Text(S.of(context).sign_in_with_login_and_password),
                onPressed: () {
                  Get.to(LoginAndPasswordPage());
                }),
          ),
        ],
      ),
    );
  }
}
