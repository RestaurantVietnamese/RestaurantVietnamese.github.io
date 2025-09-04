// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  bool get useLineHeight =>
      item.id == '43' ||
      item.id == '44' ||
      item.id == '45' ||
      item.id == '46' ||
      item.id == '47';

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
              // SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: item.id,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            height: useLineHeight ? 1 : null),
                      ),
                      if (item.id != '')
                        TextSpan(
                            text: '. ',
                            style: TextStyle(height: useLineHeight ? 1 : null)),
                      WidgetSpan(child: SizedBox(width: 17)),
                      TextSpan(
                          text: item.descriptionDe,
                          style: getFontB(state,
                              lineHeight: useLineHeight ? 1 : null)),
                      TextSpan(
                          text: ' / ',
                          style: getFontB(state,
                              lineHeight: useLineHeight ? 1 : null)),
                      TextSpan(
                          text: item.descriptionEn,
                          style: getFontC(state,
                              lineHeight: useLineHeight ? 1 : null)),
                      WidgetSpan(child: SizedBox(width: 138)),
                      TextSpan(
                        text: item.options.first.tags.join(', '),
                        style: getFontD(state,
                            lineHeight: useLineHeight ? 1 : null),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                item.options.first.prices2,
                style: getFontD(state, lineHeight: useLineHeight ? 1 : null),
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
