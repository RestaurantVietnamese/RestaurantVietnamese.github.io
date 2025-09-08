// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
import 'package:puzzel/menu_foods/page_menu_item/QrCodeScreen.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_2.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu0 extends StatefulWidget {
  const PageMenu0({
    super.key,
  });

  @override
  State<PageMenu0> createState() => _PageMenu0State();
}

class _PageMenu0State extends State<PageMenu0> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => InteractiveViewer(
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.1, // zoom nhỏ hơn để vừa khung
        maxScale: 3.0,
        child: FittedBox(
          fit: BoxFit.contain, // scale toàn bộ nội dung vừa khung
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 670,
                  child: Image.asset(
                    'assets/images/img_menu_page_0.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.all(0),
                    color: Colors.white,
                    height: 130,
                    child: QrCodeScreen()),
              ),
              Positioned(
                bottom: 0,
                left: 130,
                right: 0,
                child: Container(
                  height: 130,
                  padding: EdgeInsets.only(left: 15, top: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    Color(0xff2c4e33),
                    Color(0xff426d46),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          'Sophienstraße 27-29, 76530 Baden-Baden',
                          style: getTextStyleNormal(size: 13),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Mo: Ruhetag',
                        style: getTextStyleNormal(),
                      ),
                      Text(
                        'So - Do: 11-22 Uhr | Fr - Sa: 11-23 Uhr Lieferservice | Takeaway',
                        style: getTextStyleNormal(),
                      ),
                      Text(
                        'Tel.: 07221 9706660',
                        style: getTextStyleNormal(size: 26),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 0.1)),
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getTextStyleNormal({double? size}) {
    return GoogleFonts.poppins(
        fontWeight: FontWeight.w600, fontSize: size, color: Colors.white);
  }
}
