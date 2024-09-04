import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/features/auth/tree/login_and_password/presentation/bloc/login_and_password_bloc.dart';
import 'package:study_app/generated/l10n.dart';


class LoginAndPasswordPage extends StatelessWidget {
  const LoginAndPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.put(LoginAndPasswordBloc()),
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).sign_in_with_login_and_password)),
        body: const _LoginBody(),
        floatingActionButton: _SignInButton(),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(S.of(context).sign_in),
      onPressed: () {
        context.read<LoginAndPasswordBloc>().add(SignInWithLoginAndPassword());
      },
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: _EmailField(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: _PasswordField(),
          ),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginAndPasswordBloc>();
    return TextField(
      controller: bloc.emailController,
      decoration: InputDecoration(
        label: Text(S.of(context).email),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginAndPasswordBloc>();
    return TextField(
      controller: bloc.passwordController,
      decoration: InputDecoration(
        label: Text(S.of(context).password),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
