// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget7 extends StatelessWidget {
  final MenuItem item;
  final bool usePadding;
  final bool useLineHeight;
  final bool usePaddingPage6;
  final Function(MenuOption, bool)? onEditPrice;

  const MenuItemWidget7(
      {Key? key,
      required this.item,
      this.usePadding = true,
      this.useLineHeight = true,
      this.usePaddingPage6 = false,
      this.onEditPrice
      })
      : super(key: key);

  bool get isWhite =>
      item.id == '18' ||
      item.id == '19' ||
      item.id == '20' ||
      item.id == '21' ||
      item.id == '23' ||
      item.id == '27' ||
      item.id == '28' ||
      item.id == '29' ||
      item.id == '38';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
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
                          color: isWhite ? Colors.white : null,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '. ',
                        style: TextStyle(
                          color: isWhite ? Colors.white : null,
                        ), // Add space between id and title
                      ),
                      TextSpan(
                          text: item.title,
                          style: getFontA(
                            state,
                            color: isWhite ? Colors.white : null,
                          )),
                    ],
                  ),
                ),
              ),
              if (item.subText != '')
                Text(
                  item.subText ?? '',
                  style: getFontD(state, color: isWhite ? Colors.white : null),
                  textAlign: TextAlign.right,
                ),
              if (item.subIcon == true)
                Image.asset(
                  'assets/images/icon_chilli.png',
                  height: 25,
                ),
            ],
          ),
          // Mô tả tiếng Đức
          Text(item.descriptionDe,
              style: getFontB(state, color: isWhite ? Colors.white : null)),

          // Mô tả tiếng Anh (in nghiêng)
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Text(item.descriptionEn,
                style: getFontC(state, color: isWhite ? Colors.white : null)),
          ),
          // SizedBox(height: 6),

          // Danh sách option
          Column(
            children: item.options.map((opt) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1: Code (a., b., c.)
                  Expanded(
                      flex: 2,
                      child: Text(
                        opt.code,
                        style: getFontD(state,
                            color: isWhite ? Colors.white : null,
                            lineHeight: useLineHeight ? null : 1.2),
                      )),

                  // Column 2: Name
                  Expanded(
                      flex: 13,
                      child: Text(opt.name,
                          style: getFontD(state,
                              color: isWhite ? Colors.white : null,
                              lineHeight: useLineHeight ? null : 1.2))),

                  // Column 3: Tags
                  Expanded(
                    flex: 2,
                    child: opt.tags.isNotEmpty
                        ? Text(opt.tags.join(", "),
                            style: getFontD(state,
                                color: isWhite ? Colors.white : null,
                                lineHeight: useLineHeight ? null : 1.2))
                        : Container(),
                  ),

                  // Column 4: prices1
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => onEditPrice?.call(opt, true),
                      child: Text(opt.prices1,
                          textAlign: TextAlign.left,
                          style: getFontD(state,
                              color: isWhite ? Colors.white : null,
                              lineHeight: useLineHeight ? null : 1.2)),
                    ),
                  ),

                  // Column 5: prices2
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => onEditPrice?.call(opt,false),
                      child: Text(opt.prices2,
                          textAlign: TextAlign.right,
                          style: getFontD(state,
                              color: isWhite ? Colors.white : null,
                              lineHeight: useLineHeight ? null : 1.2)),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          if (usePadding) SizedBox(height: 10),
          if (usePaddingPage6) SizedBox(height: 6),
        ],
      ),
    );
  }
}
