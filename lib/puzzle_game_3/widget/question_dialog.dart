import 'dart:async';
import 'package:flutter/material.dart';
import 'package:puzzel/puzzle_game_3/widget/question_model.dart';
import 'package:puzzel/puzzle_game_3/widget/question_timer_with_animal.dart';
import 'package:puzzel/puzzle_game_3/widget/sound_manager.dart';

class QuestionDialog extends StatefulWidget {
  final int index;
  final Question question;
  final VoidCallback onCorrectAnswer;

  const QuestionDialog({
    Key? key,
    required this.index,
    required this.question,
    required this.onCorrectAnswer,
  }) : super(key: key);

  @override
  _QuestionDialogState createState() => _QuestionDialogState();
}

class _QuestionDialogState extends State<QuestionDialog> {
  int remainingSeconds = 30;
  Timer? countdownTimer;

  final soundManager = SoundManager();

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop(); // tự động đóng khi hết giờ
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Hết thời gian!',
                style: TextStyle(fontSize: 24),
              ),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // cho phép căn theo width
          children: [
            Center(
              // Câu hỏi ở giữa
              child: Text(
                'Câu hỏi số ${widget.index + 1}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: QuestionTimerWithAnimal(
                totalSeconds: 30,
                remainingSeconds: remainingSeconds,
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              widget.question.questionText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ...widget.question.options.map((option) {
              String optionChar = option.substring(0, 1);
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (optionChar == widget.question.correctOption) {
                        Navigator.pop(context);
                        widget.onCorrectAnswer();
                        soundManager.playCorrect();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Chính xác! Đáp án đúng.',
                              style: TextStyle(fontSize: 30),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        soundManager.playWrong();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Rất tiếc, câu trả lời chưa đúng.',
                              style: TextStyle(fontSize: 30),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 80),
                      alignment: Alignment.centerLeft,
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
