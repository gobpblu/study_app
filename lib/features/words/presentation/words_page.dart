import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/features/words/tree/words_trainings/presentation/words_trainings_page.dart';

import '../bloc/words_bloc.dart';
import '../repository/words_repository_impl.dart';

class WordsPage extends StatelessWidget {
  WordsPage({Key? key}) : super(key: key);

  final WordsRepositoryImpl repository = WordsRepositoryImpl();
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordsBloc()..add(LoadAllWords()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WORDS'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white38,
        ),
        body: BlocBuilder<WordsBloc, WordsState>(builder: (context, state) {
          // loadWord(context);
          switch (state.status) {
            case WordsStatus.success:
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      elevation: 10,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(WordsTrainingsPage(
                            firstId: state.items[index].firstId,
                            lastId: state.items[index].lastId,
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            state.items[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.items.length,
              );
            case WordsStatus.initial:
              return const CircularProgressIndicator();
            case WordsStatus.failure:
              return const Text('ошибка');
          }
        }),
      ),
    );
  }
}