import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/features/texts/models/text.dart';
import 'package:study_app/features/texts/presentation/text_content_page.dart';

import '../bloc/texts_bloc.dart';

class TextsPage extends StatelessWidget {
  const TextsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextsBloc()..add(LoadTexts()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white38,
          title: const Text('Texts'),
          centerTitle: true,
        ),
        body: BlocBuilder<TextsBloc, TextsState>(
          builder: (context, state) {
            return ListView(
              children:
                  state.texts?.map((e) => _TextTile(text: e)).toList() ?? [],
            );
          },
        ),
      ),
    );
  }
}

class _TextTile extends StatelessWidget {
  const _TextTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  final EnglishText text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.book),
          title: Text(text.name),
          onTap: () => Get.to(TextContentPage(text: text)),
        ),
        const Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}
