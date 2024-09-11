enum LevelEnum {
  beginner(title: 'Beginner'),
  intermediate(title: 'Intermediate'),
  advanced(title: 'Advanced'),;

  final String title;

  const LevelEnum({required this.title});
}