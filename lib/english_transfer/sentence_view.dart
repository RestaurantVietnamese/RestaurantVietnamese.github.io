import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/english_transfer/bloc/sentence_cubit.dart';
import 'package:puzzel/english_transfer/bloc/sentence_state.dart';
import 'package:reorderables/reorderables.dart';

class SentenceGameView extends StatelessWidget {
  const SentenceGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SentenceCubit, SentenceState>(
        builder: (context, state) {
          final cubit = context.read<SentenceCubit>();
          final hint =
              cubit.sentenceSet.vietnameseSentences[state.currentIndex];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppBar(title: Text(cubit.sentenceSet.title)),
                const SizedBox(height: 12),

                Text(
                  "Câu ${state.currentIndex + 1}/${cubit.sentenceSet.englishSentences.length}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Text(
                  hint,
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),

                // Selected words (reorderable)
                // Selected words (Wrap + drag & drop)
                // ReorderableWrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   needsLongPressDraggable: true, // có thể bật tắt
                //   onReorder: (oldIndex, newIndex) {
                //     final updated = List<String>.from(state.selectedWords);
                //     final movedWord = updated.removeAt(oldIndex);
                //     updated.insert(newIndex, movedWord);
                //     cubit.updateSelectedWords(updated);
                //   },
                //   children: state.selectedWords.asMap().entries.map((entry) {
                //     final index = entry.key;
                //     final word = entry.value;

                //     final correctWords = cubit
                //         .sentenceSet.englishSentences[state.currentIndex]
                //         .split(' ');
                //     final isCorrect = index < correctWords.length &&
                //         word == correctWords[index];

                //     return Chip(
                //       key: ValueKey(word), // bắt buộc có key
                //       label: Text(word),
                //       backgroundColor: state.showCheckPositions
                //           ? (isCorrect
                //               ? Colors.green.shade200
                //               : Colors.red.shade200)
                //           : null,
                //     );
                //   }).toList(),
                // ),
                ReorderableWrap(
                  spacing: 8,
                  runSpacing: 8,
                  needsLongPressDraggable: true,
                  onReorder: (oldIndex, newIndex) {
                    final updated = List<String>.from(state.selectedWords);
                    final movedWord = updated.removeAt(oldIndex);
                    updated.insert(newIndex, movedWord);
                    cubit.updateSelectedWords(updated);
                  },
                  children: state.selectedWords.asMap().entries.map((entry) {
                    final index = entry.key;
                    final word = entry.value;

                    final correctWords = cubit
                        .sentenceSet.englishSentences[state.currentIndex]
                        .split(' ');
                    final isCorrect = index < correctWords.length &&
                        word == correctWords[index];

                    return GestureDetector(
                      key: ValueKey(
                          word), // bắt buộc để ReorderableWrap hoạt động
                      onTap: () =>
                          cubit.onSelectedWordTap(word), // 👈 giữ logic cũ
                      child: Chip(
                        label: Text(word),
                        backgroundColor: state.showCheckPositions
                            ? (isCorrect
                                ? Colors.green.shade200
                                : Colors.red.shade200)
                            : null,
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // Shuffled words (tap to add)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: state.shuffledWords.map((word) {
                    return GestureDetector(
                      onTap: () => cubit.onWordTap(word),
                      child: Chip(
                        label: Text(word),
                        backgroundColor: Colors.blue.shade100,
                      ),
                    );
                  }).toList(),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cubit.checkAnswer(
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("✅ Chính xác!")),
                          ),
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("❌ Sai rồi, hãy thử lại!")),
                          ),
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("🎉 Hoàn thành tất cả câu!")),
                          ),
                        );
                      },
                      child: const Text("Kiểm tra"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.toggleCheckPositions();
                      },
                      style: ElevatedButton.styleFrom(),
                      child: const Text("Kiểm tra vị trí"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final correctAnswer = cubit
                            .sentenceSet.englishSentences[state.currentIndex];
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("💡 Gợi ý : $correctAnswer")),
                        );
                      },
                      child: const Text("Gợi ý"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Navigation buttons
                Row(
                  mainAxisAlignment: state.currentIndex > 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (state.currentIndex > 0)
                      ElevatedButton.icon(
                        onPressed: cubit.previous,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Quay lại"),
                      ),
                    ElevatedButton.icon(
                      onPressed: state.currentIndex <
                              cubit.sentenceSet.englishSentences.length - 1
                          ? cubit.next
                          : null,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text("Tiếp theo"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isCorrectAtIndex(SentenceCubit cubit, SentenceState state, int index) {
    final correctWords =
        cubit.sentenceSet.englishSentences[state.currentIndex].split(' ');
    return index < correctWords.length &&
        state.selectedWords[index] == correctWords[index];
  }
}
