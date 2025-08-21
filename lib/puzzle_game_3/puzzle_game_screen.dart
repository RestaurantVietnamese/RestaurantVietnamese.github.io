// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:puzzel/puzzle_game/content_game.dart';
import 'package:puzzel/puzzle_game_3/widget/button_section.dart';
import 'package:puzzel/puzzle_game_3/widget/question_dialog.dart';
import 'package:puzzel/puzzle_game_3/widget/question_model.dart';
import 'package:puzzel/puzzle_game_3/widget/tile_widget.dart';

class PuzzleGameScreen extends StatefulWidget {
  const PuzzleGameScreen({super.key});

  @override
  _PuzzleGameScreenState createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  bool isShowImage = false;
  final String imagePath = 'assets/images/image_g3.png';

  List<bool> revealedTiles = List.filled(9, false);
  late List<Question> questions;
  List<int> revealOrder = [0, 2, 8, 6, 1, 5, 7, 3, 4]; // Thứ tự mở ô cố định
  int currentRevealIndex = 0; // Vị trí hiện tại trong thứ tự mở
  List<bool> answeredQuestions =
      List.filled(9, false); // Theo dõi câu hỏi đã trả lời

  @override
  void initState() {
    super.initState();
    _initializeQuestions();
  }

  void _initializeQuestions() {
    questions = questionsContent;
  }

  void _startNewGame() {
    revealedTiles = List.filled(9, false);
    answeredQuestions = List.filled(9, false);
    currentRevealIndex = 0;
    isShowImage = false;
    setState(() {});
  }

  // Xử lý khi trả lời đúng bất kỳ câu hỏi nào
  void _onCorrectAnswer(int questionIndex) {
    if (answeredQuestions[questionIndex]) {
      return; // Câu hỏi đã được trả lời rồi
    }

    setState(() {
      answeredQuestions[questionIndex] = true; // Đánh dấu câu hỏi đã trả lời

      // Mở ô tiếp theo theo thứ tự cố định, không phụ thuộc vào câu hỏi
      if (currentRevealIndex < revealOrder.length) {
        int tileToReveal = revealOrder[currentRevealIndex];
        revealedTiles[tileToReveal] = true;
        currentRevealIndex++;
      }
    });
  }

  void _showRandomQuestion() async {
    // 1) Lấy các câu chưa trả lời
    final List<int> unanswered = [];
    for (int i = 0; i < answeredQuestions.length; i++) {
      if (!answeredQuestions[i]) unanswered.add(i);
    }

    if (unanswered.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bạn đã trả lời tất cả câu hỏi!')),
      );
      return;
    }

    // 2) Biến dùng chung cho hiển thị + chọn cuối
    int selected = unanswered.first; // index 0..8
    bool isRunning = true;
    bool loopStarted = false;

    // 3) Mở dialog hiệu ứng random số
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            if (!loopStarted) {
              loopStarted = true;
              // vòng quay số
              () async {
                while (isRunning) {
                  await Future.delayed(const Duration(milliseconds: 90));
                  setState(() {
                    unanswered.shuffle();
                    selected = unanswered.first; // cập nhật số đang hiển thị
                  });
                }
              }();
            }

            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              title: const Text('Đang chọn câu hỏi...'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${selected + 1}', // hiển thị 1..9
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          },
        );
      },
    );

    // 4) Quay 2s
    await Future.delayed(const Duration(seconds: 2));
    isRunning = false; // dừng quay

    // 5) Giữ số cuối thêm 2s
    await Future.delayed(const Duration(seconds: 2));

    // 6) Đóng dialog random
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    // 7) Nếu trong lúc chờ mà câu này lỡ được trả lời rồi thì thôi
    if (answeredQuestions[selected]) return;

    // 8) Mở đúng câu hỏi vừa hiển thị
    showDialog(
      context: context,
      builder: (context) {
        return QuestionDialog(
          index: selected,
          question: questions[selected],
          onCorrectAnswer: () => _onCorrectAnswer(selected),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool allRevealed = revealedTiles.every((isRevealed) => isRevealed);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/bgim.png'),
          Column(
            children: [
              SizedBox(height: 70),
              Container(
                height: 800,
                child: Stack(
                  children: [
                    if (!isShowImage)
                      Stack(
                        children: [
                          Center(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4,
                                ),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return AnimatedSwitcher(
                                    duration: Duration(milliseconds: 400),
                                    child: TileWidget(
                                      originalIndex: index,
                                      isRevealed: revealedTiles[index],
                                      imagePath: imagePath,
                                      hiddenImagePath: hiddenImagePath[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                              right: 170,
                              top: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: () => _showRandomQuestion(),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xffff909d),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'R',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    if (isShowImage)
                      Positioned.fill(
                        child: Center(
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: ButtonSection(
                    allRevealed: allRevealed,
                    isShowImage: isShowImage,
                    answeredQuestions: answeredQuestions,
                    questions: questions,
                    onShowImage: () {
                      setState(() {
                        isShowImage = true;
                      });
                    },
                    onCorrectAnswer: (index) {
                      _onCorrectAnswer(index);
                    },
                    onRandomQuestion: _showRandomQuestion),
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}
