// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_3.dart';
import 'package:puzzel/menu_foods/edit_data/edit_prices.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_6.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu3 extends StatefulWidget {
  const PageMenu3({super.key});

  @override
  State<PageMenu3> createState() => _PageMenu3State();
}

class _PageMenu3State extends State<PageMenu3> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    for (var i = 0; i < menuItems_Page3.length; i++) ...[
                      // Widget cho item hiện tại
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: aBg,
                            border: Border.all(color: Colors.transparent),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: (menuItems_Page3[i].id == '15')
                              ? MenuItemWidget6(
                                  item: menuItems_Page3[i],
                                  onEditPrice: (option, isPrice1) => editPrice(
                                    context: context,
                                    option: option,
                                    isPrice1: isPrice1,
                                    setState: setState,
                                  ),
                                )
                              : MenuItemWidget7(
                                  item: menuItems_Page3[i],
                                  onEditPrice: (option, isPrice1) => editPrice(
                                    context: context,
                                    option: option,
                                    isPrice1: isPrice1,
                                    setState: setState,
                                  ),
                                  onEditDescription: (item, isDescriptionDe) =>
                                      editDescription(
                                    context: context,
                                    item: item,
                                    isDescriptionDe: isDescriptionDe,
                                    setState: setState,
                                  ),
                                ),
                        ),
                      ),

                      // Chèn khoảng trống giữa id 15 và 16
                      if (menuItems_Page3[i].id == '15' &&
                          i + 1 < menuItems_Page3.length &&
                          menuItems_Page3[i + 1].id == '16')
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 30, bottom: 10),
                          child: Text(
                            'Main',
                            style: getFont0(state),
                          ),
                        )
                    ],
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade900, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ALLERGENE: A - Gluten, B - Krebstiere, C - Ei, D - Fisch, E - Erdnüsse, F - Soja. G - Mich,\nH - Schalenfrüchte, L. - Seferie, M - Senf, N - Sesam, O - Sulfite, R -',
                    style: GoogleFonts.lato(fontSize: 8),
                  ),
                  Text(
                    'ZUSATZSTOFFE: 1 - Konservierungsstoffe, 2 - Farbstoffe, 3 - Antioxidationsmittel,4 - Süßungsmittel, 5 - Phosphat, 6 - Schwefel, 7 - Chinin, 8 - Koffein, 9 - Geschmacksver-stärker, 10 - Schwefeldioxid und Sulfid, 11 - Phenylalalinquelle, 12 - Säuerungsmittel,13 - Surmi, 14 - geschwärzt',
                    style: GoogleFonts.lato(fontSize: 8),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
