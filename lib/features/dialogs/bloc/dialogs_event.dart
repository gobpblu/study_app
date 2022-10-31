part of 'dialogs_bloc.dart';

abstract class DialogsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDialogs extends DialogsEvent {}
