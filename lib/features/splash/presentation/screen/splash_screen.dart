import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/auth/presentation/login_page.dart';
import 'package:study_app/features/home/presentation/home_page.dart';
import 'package:study_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:study_app/features/splash/presentation/models/splash_status.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashBloc>(),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          switch (state.status) {
            case SplashStatus.loading:
              break;
            case SplashStatus.home:
              Get.to(const HomePage());
            case SplashStatus.login:
              Get.to(const LoginPage());
          }
        },
        child: Scaffold(
          body: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            Colors.black,
            Colors.grey,
            Colors.white12,
            Colors.grey,
            Colors.black,
          ])),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Выучи новое слово', style: /*GoogleFonts.abel(textStyle: */ TextStyle(fontSize: 24)),
            SizedBox(height: 128),
            Text('bear - медведь', style: /*GoogleFonts.adamina(textStyle:*/ TextStyle(fontSize: 18)),
            Text('[bi@r]'),
          ]),
        );
      },
    );
  }
}
