import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsExamplePage extends StatefulWidget {
  const TtsExamplePage({super.key, required this.textContent});
  final String textContent;

  @override
  State<TtsExamplePage> createState() => _TtsExamplePageState();
}

class _TtsExamplePageState extends State<TtsExamplePage> {
  final FlutterTts flutterTts = FlutterTts();

  String _selectedLang = "en-US"; // mặc định English
  final Map<String, String> _languages = {
    "English (US)": "en-US",
    "English (UK)": "en-GB",
    "Vietnamese": "vi-VN",
    "French": "fr-FR",
    "Japanese": "ja-JP",
  };

  Future<void> _speak() async {
    await flutterTts.setLanguage(_selectedLang);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.2);
    await flutterTts.speak(widget.textContent);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dropdown chọn ngôn ngữ
        DropdownButton<String>(
          value: _selectedLang,
          items: _languages.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.value,
              child: Text(entry.key),
            );
          }).toList(),
          onChanged: (newLang) {
            if (newLang != null) {
              setState(() {
                _selectedLang = newLang;
              });
            }
          },
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _speak,
          child: const Text("🔊 Đọc"),
        ),
      ],
    );
  }
}
