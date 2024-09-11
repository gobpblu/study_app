enum WordTrainingsEnum {
  collectListenedWord(trainingName: 'collect_listened_word'),
  chooseTranslation(trainingName: 'choose_translation'),
  collectWord(trainingName: 'collect_word');

  final String trainingName;

  const WordTrainingsEnum({required this.trainingName});
}