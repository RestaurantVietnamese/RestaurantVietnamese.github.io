import 'package:flutter/material.dart';
import 'package:puzzel/english_transfer/content_deepseek_app.dart';
import 'package:puzzel/english_transfer/sentence_game_page.dart';

class TopicSelectionPage extends StatelessWidget {
  const TopicSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Chọn chủ đề"),
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: allSentenceSets.length,
        itemBuilder: (context, index) {
          final set = allSentenceSets[index];
          return ListTile(
            title: Text(set.title),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SentenceGamePage(sentenceSet: set),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
