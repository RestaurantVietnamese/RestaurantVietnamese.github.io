// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget7 extends StatelessWidget {
  final MenuItem item;
  final bool usePadding;

  const MenuItemWidget7({Key? key, required this.item, this.usePadding = true})
      : super(key: key);
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
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '. ', // Add space between id and title
                      ),
                      TextSpan(
                          text: item.title,
                          style: getFont(
                            state.fontA,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
              if (item.subText != '')
                Text(
                  item.subText ?? '',
                  style: getFont(state.fontD,
                      fontSize: 12, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.right,
                ),
            ],
          ),
          // Mô tả tiếng Đức
          Text(item.descriptionDe,
              style: getFont(state.fontB,
                  fontSize: 12, fontWeight: FontWeight.w600)),

          // Mô tả tiếng Anh (in nghiêng)
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Text(item.descriptionEn,
                style: getFont(state.fontC,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic)),
          ),
          SizedBox(height: 6),

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
                        style: getFont(state.fontD,
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )),

                  // Column 2: Name
                  Expanded(
                      flex: 13,
                      child: Text(opt.name,
                          style: getFont(state.fontD,
                              fontSize: 12, fontWeight: FontWeight.w600))),

                  // Column 3: Tags
                  Expanded(
                    flex: 2,
                    child: opt.tags.isNotEmpty
                        ? Text(opt.tags.join(", "),
                            style: getFont(state.fontD,
                                fontSize: 12, fontWeight: FontWeight.w600))
                        : Container(),
                  ),

                  // Column 4: prices1
                  Expanded(
                    flex: 2,
                    child: Text(opt.prices1,
                        textAlign: TextAlign.left,
                        style: getFont(state.fontD,
                            fontSize: 12, fontWeight: FontWeight.w600)),
                  ),

                  // Column 5: prices2
                  Expanded(
                    flex: 2,
                    child: Text(opt.prices2,
                        textAlign: TextAlign.right,
                        style: getFont(state.fontD,
                            fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                ],
              );
            }).toList(),
          ),
          if (usePadding) SizedBox(height: 10),
        ],
      ),
    );
  }
}
