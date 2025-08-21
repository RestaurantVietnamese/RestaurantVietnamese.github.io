// Class Question vẫn giữ nguyên
class Question {
  final String questionText;
  final List<String> options;
  final String correctOption;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOption,
  });
}

// if (isShowIamge)
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: ElevatedButton.icon(
              //       onPressed: _startNewGame,
              //       icon: Icon(Icons.refresh),
              //       label: Text("Chơi lại"),
              //       style: ElevatedButton.styleFrom(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              //         textStyle: TextStyle(fontSize: 18),
              //       ),
              //     ),
              //   ),