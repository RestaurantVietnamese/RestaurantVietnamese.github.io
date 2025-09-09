class SentenceState {
  final int currentIndex;
  final List<String> selectedWords;
  final List<String> shuffledWords;
  final bool showCheckPositions;

  const SentenceState({
    required this.currentIndex,
    required this.selectedWords,
    required this.shuffledWords,
     this.showCheckPositions = false,
  });

  SentenceState copyWith({
    int? currentIndex,
    List<String>? selectedWords,
    List<String>? shuffledWords,
    bool? showCheckPositions,
  }) {
    return SentenceState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedWords: selectedWords ?? this.selectedWords,
      shuffledWords: shuffledWords ?? this.shuffledWords,
      showCheckPositions: showCheckPositions ?? this.showCheckPositions,
    );
  }
}