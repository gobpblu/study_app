import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/common/widgets/action_button.dart';
import 'package:study_app/features/auth/bloc/auth_bloc.dart';
import 'package:study_app/features/home/presentation/home_page.dart';
import 'package:study_app/generated/l10n.dart';

import '../../../core/res/fonts.dart';

class DisplayNamePage extends StatelessWidget {
  const DisplayNamePage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isUsernameChanged) {
          Get.off(const HomePage());
        }
      },
      builder: (context, state) {
        switch (state.isLoading) {
              case true:
                return const Center(child: CircularProgressIndicator());
              default:
                return Scaffold(
                  floatingActionButtonLocation: FloatingActionButtonLocation
                      .centerDocked,
                  floatingActionButton: ActionButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(UpdateUsername(user: user));
                    },
                  ),
                  appBar: AppBar(
                    title: Text(
                      S.of(context).auth_title,
                      style: TextStyle(
                          fontFamily: playfairDisplay, fontSize: 18),
                    ),
                    centerTitle: true,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 96.0),
                        child: TextFormField(
                              decoration: InputDecoration(labelText: S.of(context).auth_username),
                              onChanged: (text) {
                                context.read<AuthBloc>().add(UsernameChanged(
                                    username: text));
                              },
                            ),
                      ),
                    ],
                  ),
                );
            }
          },
    );
  }
}
