part of 'dialogs_bloc.dart';

enum DialogsStatus { initial, success, failure }

class DialogsState extends Equatable {
  const DialogsState({required this.status, this.dialogs});

  final DialogsStatus status;
  final List<EnglishDialog>? dialogs;

  @override
  List<Object?> get props => [dialogs];

  DialogsState copyWith({
    DialogsStatus? status,
    List<EnglishDialog>? dialogs,
  }) {
    return DialogsState(
      status: status ?? this.status,
      dialogs: dialogs ?? this.dialogs,
    );
  }
}
