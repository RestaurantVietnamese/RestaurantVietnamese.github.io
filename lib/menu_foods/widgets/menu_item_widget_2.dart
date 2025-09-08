// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget2 extends StatelessWidget {
  final MenuItem item;
  final void Function(MenuOption option, bool isPrice1)? onEditPrice;
  final void Function(MenuItem item, bool isDescriptionDe)? onEditDescription;

  const MenuItemWidget2({
    Key? key,
    required this.item,
    this.onEditPrice,
    this.onEditDescription,
  }) : super(key: key);

  bool get isWhite => item.id == '6';

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
                          color: isWhite ? Colors.white : null,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: '. ',
                          style:
                              TextStyle(color: isWhite ? Colors.white : null)),
                      TextSpan(
                        text: item.title,
                        style: getFontA(state,
                            color: isWhite ? Colors.white : null),
                      ),
                      TextSpan(
                        text: item.subText,
                        style: getFontB(state,
                            color: isWhite ? Colors.white : null),
                      ),
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
            ],
          ),
          //  Text(item.subText ?? '1'),

          // Mỗi option một dòng (Row)
          ...item.options.map((opt) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cột 1: Mô tả tiếng Đức (flex: 10)
                Expanded(
                  flex: 10,
                  child: GestureDetector(
                    onTap: () => onEditDescription?.call(item, true),
                    child: Text(
                      item.descriptionDe,
                      style:
                          getFontB(state, color: isWhite ? Colors.white : null),
                    ),
                  ),
                ),

                // Cột 2: Tags (flex: 2)
                Expanded(
                  flex: 2,
                  child: opt.tags.isNotEmpty
                      ? Text(
                          opt.tags.join(", "),
                          style: getFontD(state,
                              color: isWhite ? Colors.white : null),
                        )
                      : SizedBox.shrink(),
                ),

                // Cột 3: Giá 300 (flex: 2)
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => onEditPrice?.call(opt, true),
                    child: Text(
                      opt.prices1.isNotEmpty ? opt.prices1 : '',
                      style:
                          getFontD(state, color: isWhite ? Colors.white : null),
                    ),
                  ),
                ),

                // Cột 4: Giá 750 (flex: 2)
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => onEditPrice?.call(opt, false),
                    child: Text(
                      opt.prices2.isNotEmpty ? opt.prices2 : '',
                      textAlign: TextAlign.right,
                      style:
                          getFontD(state, color: isWhite ? Colors.white : null),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),

          // Mô tả tiếng Anh (in nghiêng)
          GestureDetector(
            onTap: () => onEditDescription?.call(item, false),
            child: Text(
              item.descriptionEn,
              style: getFontC(state, color: isWhite ? Colors.white : null),
            ),
          ),
          if (item.id == '3') SizedBox(height: 10),
        ],
      ),
    );
  }
}
