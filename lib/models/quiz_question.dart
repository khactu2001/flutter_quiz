class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  // create a new list of answers before shuffle
  List<String> getShuffledAnswers() {
    // copy the list
    final shuffledList = List.of(answers);
    // shuffle
    shuffledList.shuffle();
    // return
    return shuffledList;
  }
}
