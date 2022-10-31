import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/dialogs/repository/dialogs_repository_impl.dart';

import '../models/english_dialog.dart';
import '../repository/dialogs_repository.dart';

part 'dialogs_event.dart';

part 'dialogs_state.dart';

class DialogsBloc extends Bloc<DialogsEvent, DialogsState> {
  DialogsBloc() : super(const DialogsState(status: DialogsStatus.initial)) {
    on<LoadDialogs>(_onLoadTexts);
  }

  final DialogsRepository _repository = DialogsRepositoryImpl();

  Future<void> _onLoadTexts(
    LoadDialogs event,
    Emitter<DialogsState> emit,
  ) async {
    final dialogs = await _repository.loadDialogsFromLocal(2);
    print(dialogs);
    emit(state.copyWith(status: DialogsStatus.success, dialogs: dialogs));
  }
}
