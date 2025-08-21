import 'package:flutter/material.dart';
import 'package:puzzel/puzzle_game_3/widget/build_circle_container.dart';
import 'package:puzzel/puzzle_game_3/widget/question_dialog.dart';
import 'package:puzzel/puzzle_game_3/widget/question_model.dart';

class ButtonSection extends StatelessWidget {
  final bool allRevealed;
  final bool isShowImage;
  final List<bool> answeredQuestions;
  final List<Question> questions;
  final VoidCallback onShowImage; // callback để thay đổi state ở cha
  final Function(int) onCorrectAnswer; // callback cho trả lời đúng
//
  final VoidCallback onRandomQuestion;
  const ButtonSection({
    Key? key,
    required this.allRevealed,
    required this.isShowImage,
    required this.answeredQuestions,
    required this.questions,
    required this.onShowImage,
    required this.onCorrectAnswer,
    required this.onRandomQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (allRevealed && !isShowImage)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: onShowImage,
              icon: const Icon(Icons.auto_fix_high),
              label: const Text("Sắp xếp lại ảnh"),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        const SizedBox(height: 20),
        if (!allRevealed)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: onRandomQuestion,
              icon: Icon(Icons.shuffle),
              label: Text("Câu hỏi ngẫu nhiên"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(9, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: answeredQuestions[index] || allRevealed
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return QuestionDialog(
                                  index: index,
                                  question: questions[index],
                                  onCorrectAnswer: () {
                                    onCorrectAnswer(index);
                                  },
                                );
                              },
                            );
                          },
                    child: CircleContainer(
                      number: index + 1,
                      color: answeredQuestions[index]
                          ? Colors.green.shade500
                          : const Color(0xffff909d),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
