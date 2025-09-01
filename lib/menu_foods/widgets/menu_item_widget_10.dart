// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget10 extends StatelessWidget {
  final MenuItem item;

  const MenuItemWidget10({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề món ăn
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: item.id,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                      if (item.id != '') TextSpan(text: '. '),
                      WidgetSpan(child: SizedBox(width: 17)),
                      TextSpan(
                          text: item.descriptionDe, style: getFontB(state)),
                      TextSpan(text: ' / ', style: getFontB(state)),
                      TextSpan(
                          text: item.descriptionEn, style: getFontC(state)),
                      WidgetSpan(child: SizedBox(width: 126)),
                      TextSpan(
                        text: item.options.first.tags.join(', '),
                        style: getFontD(state),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                item.options.first.prices2,
                style: getFontD(state),
              ),
            ],
          ),

          // Mỗi option một dòng (Row)

          // Mô tả tiếng Anh (in nghiêng)

          // SizedBox(height: 6),
        ],
      ),
    );
  }
}
