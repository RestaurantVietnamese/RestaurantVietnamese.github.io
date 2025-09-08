// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final void Function(MenuOption option, bool isPrice1)? onEditPrice;
  final void Function(MenuItem item, bool isDescriptionDe)? onEditDescription;

  const MenuItemWidget({
    Key? key,
    required this.item,
    this.onEditPrice,
    this.onEditDescription,
  }) : super(key: key);

  bool isWhite() {
    return item.id == '7';
  }

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
                          color: isWhite() ? Colors.white : Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: '. ',
                          style: TextStyle(
                              color: isWhite()
                                  ? Colors.white
                                  : Colors
                                      .black) // Add space between id and title
                          ),
                      TextSpan(
                          text: item.title,
                          style: getFontA(
                            state,
                            color: isWhite() ? Colors.white : Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              if (item.subText != '')
                Text(
                  item.subText ?? '',
                  style: getFontD(
                    state,
                    color: isWhite() ? Colors.white : Colors.black,
                  ),
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
          GestureDetector(
            onTap: () => onEditDescription?.call(item, true),
            child: Text(item.descriptionDe,
                style: getFontB(
                  state,
                  color: isWhite() ? Colors.white : Colors.black,
                )),
          ),

          // Mô tả tiếng Anh (in nghiêng)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => onEditDescription?.call(item, false),
              child: Text(item.descriptionEn,
                  style: getFontC(
                    state,
                    color: isWhite() ? Colors.white : Colors.black,
                  )),
            ),
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
                        style: getFontD(
                          state,
                          color: isWhite() ? Colors.white : Colors.black,
                        ),
                      )),

                  // Column 2: Name
                  Expanded(
                      flex: 8,
                      child: Text(opt.name,
                          style: getFontD(
                            state,
                            color: isWhite() ? Colors.white : Colors.black,
                          ))),

                  // Column 3: Tags
                  Expanded(
                    flex: 2,
                    child: opt.tags.isNotEmpty
                        ? Text(opt.tags.join(", "),
                            style: getFontD(
                              state,
                              color: isWhite() ? Colors.white : Colors.black,
                            ))
                        : Container(),
                  ),

                  // Column 4: prices1
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => onEditPrice?.call(opt, true),
                      child: Text(opt.prices1,
                          textAlign: TextAlign.left, style: getFontD(state)),
                    ),
                  ),

                  // Column 5: prices2
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => onEditPrice?.call(opt, false),
                      child: Text(opt.prices2,
                          textAlign: TextAlign.right,
                          style: getFontD(
                            state,
                            color: isWhite() ? Colors.white : Colors.black,
                          )),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
