import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/dialogs_bloc.dart';
import '../models/english_dialog.dart';
import 'dialog_content_page.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DialogsBloc()..add(LoadDialogs()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white38,
          title: const Text('Dialogs'),
          centerTitle: true,
        ),
        body: BlocBuilder<DialogsBloc, DialogsState>(
          builder: (context, state) {
            return ListView(
              children:
                  state.dialogs?.map((e) => _DialogTile(dialog: e)).toList() ??
                      [],
            );
          },
        ),
      ),
    );
  }
}

class _DialogTile extends StatelessWidget {
  const _DialogTile({
    Key? key,
    required this.dialog,
  }) : super(key: key);

  final EnglishDialog dialog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.book),
          title: Text(dialog.name),
          onTap: () => Get.to(DialogContentPage(dialog: dialog)),
        ),
        const Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}
