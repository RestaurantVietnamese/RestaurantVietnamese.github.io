// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/menu_page.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => FontCubit(),
      child: MenuApp(),
    ),
  );
}

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}
