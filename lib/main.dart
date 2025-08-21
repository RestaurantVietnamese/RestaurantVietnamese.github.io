// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzel/english_transfer/topic_selection_page.dart';
import 'package:puzzel/puzzle_game/crossword_puzzle.dart';
import 'package:puzzel/puzzle_game/video_player.dart';
import 'package:puzzel/puzzle_game_3/puzzle_game_screen.dart';

void main() {
  runApp(VietnameseCrosswordApp());
}

class VietnameseCrosswordApp extends StatelessWidget {
  const VietnameseCrosswordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GIẢI MÃ Ô CHỮ',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // home: VideoPlayerFromAsset(),
          home: PuzzleGameScreen(),
        );
      },
    );
  }
}
