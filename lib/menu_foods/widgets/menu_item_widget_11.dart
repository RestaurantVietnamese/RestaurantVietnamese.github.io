// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget11 extends StatelessWidget {
  final MenuItem item;
  final bool usePadding;
  final void Function(MenuOption option, bool isPrice1)? onEditPrice;

  const MenuItemWidget11(
      {Key? key, required this.item, this.usePadding = true, this.onEditPrice})
      : super(key: key);

  bool get isWhite =>
      item.title == 'Maki Rolls' ||
      item.title == 'California Rolls' ||
      item.title == 'Tempura Rolls';
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
                      if (item.id != '') ...[
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
                        )
                      ],
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
                  style: getFontD(
                    state,
                    color: isWhite ? Colors.white : null,
                  ),
                  textAlign: TextAlign.right,
                ),
            ],
          ),

          // Danh sách option
          Column(
            children: item.options.map((opt) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (opt.code.startsWith('I') ||
                          opt.code.startsWith('T')) ...[
                        Expanded(
                            flex: 14,
                            child: Text('${opt.code} ${opt.name}',
                                style: getFontD(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                )))
                      ],
                      if (opt.code.startsWith('M')) ...[
                        Expanded(
                            flex: 2,
                            child: Text(
                              opt.code,
                              style: getFontD(
                                state,
                                color: isWhite ? Colors.white : null,
                              ),
                            )),

                        // Column 2: Name
                        Expanded(
                            flex: 12,
                            child: Text(opt.name,
                                style: getFontD(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                ))),
                      ],

                      // Column 3: Tags
                      Expanded(
                        flex: 2,
                        child: opt.tags.isNotEmpty
                            ? Text(opt.tags.join(", "),
                                style: getFontD(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                ))
                            : Container(),
                      ),

                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () => onEditPrice?.call(opt, false),
                          child: Text(opt.prices2,
                              textAlign: TextAlign.right,
                              style: getFontD(
                                state,
                                color: isWhite ? Colors.white : null,
                              )),
                        ),
                      ),
                    ],
                  ),
                  if (opt.descriptionDe.isNotEmpty)
                    (opt.code != 'I4.' &&
                            opt.code != 'I5.' &&
                            opt.code != 'T1.' &&
                            opt.code != 'T2.' &&
                            opt.code != 'T3.' &&
                            opt.code != 'T4.')
                        ? Row(
                            children: [
                              Text(
                                opt.descriptionDe,
                                style: getFontB(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                ),
                              ),
                              Text(' / '),
                              Text(
                                opt.descriptionEn,
                                style: getFontC(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                opt.descriptionDe,
                                style: getFontB(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                ),
                              ),
                              Text(
                                opt.descriptionEn,
                                style: getFontC(
                                  state,
                                  color: isWhite ? Colors.white : null,
                                ),
                              ),
                            ],
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
