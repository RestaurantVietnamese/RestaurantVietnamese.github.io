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

  const MenuItemWidget11({Key? key, required this.item, this.usePadding = true})
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
                      if (item.id != '') ...[
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
                        )
                      ],
                      TextSpan(text: item.title, style: getFontA(state)),
                    ],
                  ),
                ),
              ),
              if (item.subText != '')
                Text(
                  item.subText ?? '',
                  style: getFontD(state),
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
                                style: getFontD(state)))
                      ],
                      if (opt.code.startsWith('M')) ...[
                        Expanded(
                            flex: 2,
                            child: Text(
                              opt.code,
                              style: getFontD(state),
                            )),

                        // Column 2: Name
                        Expanded(
                            flex: 12,
                            child: Text(opt.name, style: getFontD(state))),
                      ],

                      // Column 3: Tags
                      Expanded(
                        flex: 2,
                        child: opt.tags.isNotEmpty
                            ? Text(opt.tags.join(", "), style: getFontD(state))
                            : Container(),
                      ),

                      Expanded(
                        flex: 2,
                        child: Text(opt.prices2,
                            textAlign: TextAlign.right, style: getFontD(state)),
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
                                style: getFontB(state),
                              ),
                              Text(' / '),
                              Text(
                                opt.descriptionEn,
                                style: getFontC(state),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                opt.descriptionDe,
                                style: getFontB(state),
                              ),
                              Text(
                                opt.descriptionEn,
                                style: getFontC(state),
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
