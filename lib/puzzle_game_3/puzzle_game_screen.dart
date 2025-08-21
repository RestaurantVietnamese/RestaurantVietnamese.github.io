import 'package:flutter/material.dart';

class PuzzleGameScreen extends StatefulWidget {
  @override
  _PuzzleGameScreenState createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  final String imagePath = 'assets/images/image_g3.png';

  late List<int> tileOrder;
  List<bool> revealedTiles = List.filled(9, false);

  List<String> questions = [
    "Câu hỏi 1?",
    "Câu hỏi 2?",
    "Câu hỏi 3?",
    "Câu hỏi 4?",
    "Câu hỏi 5?",
    "Câu hỏi 6?",
    "Câu hỏi 7?",
    "Câu hỏi 8?",
    "Câu hỏi 9?",
  ];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  // Hàm để bắt đầu một trò chơi mới
  void _startNewGame() {
    tileOrder = List.generate(9, (index) => index)..shuffle();
    revealedTiles = List.filled(9, false);
    setState(() {});
  }

  void onAnswerCorrect(int questionIndex) {
    setState(() {
      revealedTiles[questionIndex] = true;
    });
  }

  // Thêm hàm kiểm tra xem tất cả các ô đã được mở chưa
  bool _allTilesRevealed() {
    return revealedTiles.every((isRevealed) => isRevealed);
  }

  // Thêm hàm xử lý khi người dùng muốn sắp xếp lại ảnh
  void _rearrangeTiles() {
    setState(() {
      // Đặt lại tileOrder về thứ tự ban đầu (0, 1, 2, ...) để sắp xếp ảnh
      tileOrder = List.generate(9, (index) => index);
    });
  }

  Widget buildTile(int originalIndex) {
    final row = originalIndex ~/ 3;
    final col = originalIndex % 3;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!revealedTiles[originalIndex]) {
          return Container(
            key: ValueKey('unrevealed_$originalIndex'),
            color: Colors.grey.shade400,
          );
        }

        return ClipRect(
          key: ValueKey('revealed_$originalIndex'),
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: OverflowBox(
              maxWidth: constraints.maxWidth * 3,
              maxHeight: constraints.maxHeight * 3,
              alignment: FractionalOffset(col / 2, row / 2),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  void showQuestionDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Trả lời câu hỏi'),
          content: Text(questions[index]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onAnswerCorrect(index);
              },
              child: Text('Đúng'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Sai'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Kiểm tra trạng thái để quyết định hiển thị nút
    final bool allRevealed = _allTilesRevealed();

    return Scaffold(
      appBar: AppBar(title: Text("Puzzle Quiz Game")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    final originalIndex = tileOrder[index];
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: buildTile(originalIndex),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                if (allRevealed)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton.icon(
                      onPressed: _rearrangeTiles,
                      icon: Icon(Icons.auto_fix_high),
                      label: Text("Sắp xếp lại ảnh"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Câu hỏi ${index + 1}"),
                        trailing: revealedTiles[index]
                            ? Icon(Icons.check, color: Colors.green)
                            : ElevatedButton(
                                onPressed: () => showQuestionDialog(index),
                                child: Text("Trả lời"),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}