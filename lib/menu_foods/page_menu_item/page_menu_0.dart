// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_2.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu0 extends StatefulWidget {
  const PageMenu0({
    super.key,
  });

  @override
  State<PageMenu0> createState() => _PageMenu0State();
}

class _PageMenu0State extends State<PageMenu0> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => InteractiveViewer(
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.1, // zoom nhỏ hơn để vừa khung
        maxScale: 3.0,
        child: FittedBox(
          fit: BoxFit.contain, // scale toàn bộ nội dung vừa khung
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/img_menu_page_0.jpg',
                ),
              ),
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 0.1)),
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
