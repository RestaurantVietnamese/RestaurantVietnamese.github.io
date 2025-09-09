// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/english_transfer/content_deepseek_app.dart';
import 'package:puzzel/english_transfer/bloc/sentence_state.dart';

class SentenceCubit extends Cubit<SentenceState> {
  final SentenceSet sentenceSet;
  final Map<int, List<String>> _selectedWordMap = {};
  final Map<int, List<String>> _shuffledWordMap = {};

  SentenceCubit(this.sentenceSet)
      : super(SentenceState(
          currentIndex: 0,
          selectedWords: [],
          shuffledWords: [],
        )) {
    loadCurrentSentence();
  }

  void loadCurrentSentence() {
    final index = state.currentIndex;
    final selected = List<String>.from(_selectedWordMap[index] ?? []);

    List<String> shuffled;
    if (_shuffledWordMap.containsKey(index)) {
      shuffled = List<String>.from(_shuffledWordMap[index]!);
    } else {
      final words = sentenceSet.englishSentences[index].split(' ');
      words.shuffle(Random());
      words.removeWhere((w) => selected.contains(w));
      shuffled = List<String>.from(words);
      _shuffledWordMap[index] = List<String>.from(shuffled);
    }

    emit(SentenceState(
      currentIndex: index,
      selectedWords: selected,
      shuffledWords: shuffled,
    ));
  }

  void onWordTap(String word) {
    final selected = List<String>.from(state.selectedWords)..add(word);
    final shuffled = List<String>.from(state.shuffledWords)..remove(word);

    _selectedWordMap[state.currentIndex] = selected;
    _shuffledWordMap[state.currentIndex] = shuffled;

    emit(state.copyWith(selectedWords: selected, shuffledWords: shuffled));
  }

  void onSelectedWordTap(String word) {
    final selected = List<String>.from(state.selectedWords)..remove(word);
    final shuffled = List<String>.from(state.shuffledWords)..add(word);

    _selectedWordMap[state.currentIndex] = selected;
    _shuffledWordMap[state.currentIndex] = shuffled;

    emit(state.copyWith(selectedWords: selected, shuffledWords: shuffled));
  }

  void checkAnswer(
      Function onCorrect, Function onIncorrect, Function onComplete) {
    final correct = sentenceSet.englishSentences[state.currentIndex];
    final attempt = state.selectedWords.join(' ');

    if (attempt == correct) {
      onCorrect();
      Future.delayed(const Duration(milliseconds: 800), () {
        if (state.currentIndex < sentenceSet.englishSentences.length - 1) {
          next();
        } else {
          onComplete();
        }
      });
    } else {
      onIncorrect();
    }
  }

  void next() {
    if (state.currentIndex < sentenceSet.englishSentences.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
      loadCurrentSentence();
    }
  }

  void previous() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
      loadCurrentSentence();
    }
  }

  void toggleCheckPositions() {
    // Bật check vị trí
    emit(state.copyWith(showCheckPositions: true));

    // Sau 2 giây thì tắt
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(showCheckPositions: false));
    });
  }

  void updateSelectedWords(List<String> words) {
    emit(state.copyWith(selectedWords: words));
  }
}
