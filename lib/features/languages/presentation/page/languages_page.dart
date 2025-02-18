import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/languages/domain/language_type.dart';
import 'package:study_app/features/languages/presentation/bloc/languages_cubit.dart';

import '../../../../generated/l10n.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguagesCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).languages_title),
        ),
        body: const _Body(),
        floatingActionButton: _SaveButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    return BlocBuilder<LanguagesCubit, LanguagesState>(
      builder: (context, state) {
        if (state.isLoading) return const Center(child: CircularProgressIndicator());
        return ListView(
          children: LanguageType.values
              .map((e) => _LanguageWidget(languageType: e, isSelected: state.selectedLanguageType == e))
              .toList(),
        );
      },
    );
  }
}

class _LanguageWidget extends StatelessWidget {
  const _LanguageWidget({super.key, required this.languageType, required this.isSelected});

  final LanguageType languageType;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LanguagesCubit>();
    return ListTile(
      onTap: () => cubit.changeLanguage(languageType),
      title: Text(languageType.title),
      leading: SvgPicture.asset(languageType.iconPath, width: 40, height: 40),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.blueAccent, size: 24) : null,
      contentPadding: const EdgeInsets.all(8),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LanguagesCubit>();
    return TextButton(
      onPressed: cubit.saveUserLanguage,
      style: ElevatedButton.styleFrom(backgroundColor: enterWordsBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Text(
          S.of(context).language_button_save,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
