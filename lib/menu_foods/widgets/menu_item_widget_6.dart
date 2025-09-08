// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget6 extends StatelessWidget {
  final MenuItem item;
  final void Function(MenuOption option, bool isPrice1)? onEditPrice;

  const MenuItemWidget6({
    Key? key,
    required this.item,
    this.onEditPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề món ăn
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: item.id,
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: '. '),
                      TextSpan(
                        text: item.title,
                        style: getFontA(state),
                      ),
                    ],
                  ),
                ),
              ),
              if (item.options.isNotEmpty && item.options.first.prices2 != '')
                GestureDetector(
                  onTap: () => onEditPrice?.call(item.options.first, false),
                  child: Text(
                    item.options.first.prices2,
                    style: getFontD(state),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),

          SizedBox(height: 6),
        ],
      ),
    );
  }
}
