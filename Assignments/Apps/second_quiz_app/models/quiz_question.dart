class QuizQuestion {
  final String text;
  final List<String> answers;

  QuizQuestion(this.text, this.answers);

  List<String> get shuffleAnswers {
    List<String> shuffleAnswers = List.of(answers);
    shuffleAnswers.shuffle();
    return shuffleAnswers;
  }
}
