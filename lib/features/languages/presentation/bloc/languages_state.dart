part of 'languages_cubit.dart';

class LanguagesState extends Equatable {
  final LanguageType selectedLanguageType;
  final bool isLoading;

  const LanguagesState({
    required this.selectedLanguageType,
    required this.isLoading,
  });


  LanguagesState copyWith({
    LanguageType? selectedLanguageType,
    bool? isLoading,
  }) {
    return LanguagesState(
      selectedLanguageType: selectedLanguageType ?? this.selectedLanguageType,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isLoading, selectedLanguageType];
}
