import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/auth/bloc/auth_bloc.dart';
import 'package:study_app/features/auth/presentation/display_name_page.dart';
import 'package:study_app/features/languages/presentation/page/languages_page.dart';
import 'package:study_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:study_app/generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).profile_title),
          actions: [_LogoutButton()],
        ),
        body: Column(
          children: [
            _NameField(),
            _ChangeUsernameButton(),
            _ChangeStudyLanguageButton(),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return IconButton(onPressed: cubit.logout, icon: const Icon(Icons.logout));
  }
}

class _NameField extends StatelessWidget {
  const _NameField({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileCubit cubit) => cubit.state.user);
    if (user == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text('Имя пользователя: '),
          Text(user.displayName ?? ''),
        ],
      ),
    );
  }
}

class _ChangeUsernameButton extends StatelessWidget {
  const _ChangeUsernameButton({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileCubit cubit) => cubit.state.user);
    if (user == null) return const SizedBox();
    return ListTile(
      title: Text(S.of(context).profile_button_change_username),
      leading: const Icon(Icons.track_changes),
      onTap: () => Get.to(
        BlocProvider(create: (context) => AuthBloc(), child: DisplayNamePage(isFromProfile: true, user: user)),
      ),
    );
  }
}

class _ChangeStudyLanguageButton extends StatelessWidget {
  const _ChangeStudyLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).profile_button_change_study_language),
      leading: const Icon(Icons.language),
      onTap: () => Get.to(const LanguagesPage()),
    );
  }
}