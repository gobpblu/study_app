import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/languages/domain/language_type.dart';
import 'package:study_app/features/languages/domain/languages_interactor.dart';

part 'languages_state.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  final LanguagesInteractor _languagesInteractor;

  LanguagesCubit({required LanguagesInteractor languagesInteractor})
      : _languagesInteractor = languagesInteractor,
        super(
          LanguagesState(
            selectedLanguageType: languagesInteractor.getCurrentLanguage(),
            isLoading: false,
          ),
        );

  Future saveUserLanguage() async {
    emit(state.copyWith(isLoading: true));
    final language = state.selectedLanguageType;
    await _languagesInteractor.saveUserLanguage(language);
    emit(state.copyWith(isLoading: false));
  }

  void changeLanguage(LanguageType language) {
    emit(state.copyWith(selectedLanguageType: language));
  }
}
