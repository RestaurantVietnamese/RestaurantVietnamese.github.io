import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playCorrect() async {
    await _player.play(AssetSource('sounds/correct.mp3'));
  }

  Future<void> playWrong() async {
    await _player.play(AssetSource('sounds/wrong.mp3'));
  }

  Future<void> playGameOver() async {
    await _player.play(AssetSource('sounds/vietnamcobacho.mp3'));
  }
}


// final soundManager = SoundManager();

// // Khi trả lời đúng
// soundManager.playCorrect();

// // Khi trả lời sai
// soundManager.playWrong();

// // Khi kết thúc trò chơi
// soundManager.playGameOver();
