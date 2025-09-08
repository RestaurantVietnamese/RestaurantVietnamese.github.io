// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_2.dart';
import 'package:puzzel/menu_foods/edit_data/edit_prices.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_3.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_4.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_5.dart';
import 'package:puzzel/widget/change_image_background/PositionedImageChangeBackGround.dart';
import 'package:puzzel/widget/change_image_background/show_dialog_change_image.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu2 extends StatefulWidget {
  const PageMenu2({super.key});

  @override
  State<PageMenu2> createState() => _PageMenu2State();
}

class _PageMenu2State extends State<PageMenu2> {
  String? imageUrl =
      'https://cdn.pixabay.com/photo/2024/05/02/07/07/celery-8733877_1280.jpg';

  void _pickImage() async {
    final result = await showInputDialog(
      context: context,
      title: 'Nhập link ảnh',
      hintText: 'https://example.com/image.jpg',
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        imageUrl = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => InteractiveViewer(
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.1, // zoom nhỏ hơn để vừa khung
        maxScale: 3.0,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              PositionedImageChangeBackGround(
                imageUrl: imageUrl,
                heightImage: 220,
              ),
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 10),
                    // SizedBox(height: 10),
                    SizedBox(height: 2),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    // SizedBox(height: 10),
                    // SizedBox(height: 10),
                    Column(
                      children: menuItems_Page2.map((item) {
                        Widget widgetItem;

                        if (item.id == '11' ||
                            item.id == '12' ||
                            item.id == '13') {
                          widgetItem = MenuItemWidget3(
                            item: item,
                            onEditPrice: (option, isPrice1) => editPrice(
                              context: context,
                              option: option,
                              isPrice1: isPrice1,
                              setState: setState,
                            ),
                          );
                        } else if (item.id == '8') {
                          widgetItem = MenuItemWidget4(
                            item: item,
                            onEditPrice: (option, isPrice1) => editPrice(
                              context: context,
                              option: option,
                              isPrice1: isPrice1,
                              setState: setState,
                            ),
                          );
                        } else if (item.id == '9' || item.id == '10') {
                          widgetItem = MenuItemWidget5(
                            item: item,
                            onEditPrice: (option, isPrice1) => editPrice(
                              context: context,
                              option: option,
                              isPrice1: isPrice1,
                              setState: setState,
                            ),
                          );
                        } else {
                          widgetItem = MenuItemWidget(
                            item: item,
                            onEditPrice: (option, isPrice1) => editPrice(
                              context: context,
                              option: option,
                              isPrice1: isPrice1,
                              setState: setState,
                            ),
                          );
                        }

                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  if (item.id == '13' || item.id == '12')
                                    _pickImage();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 30,
                                      right: item.id == '8' ? 10 : 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: Colors.transparent),
                                  ),
                                  child: widgetItem,
                                ),
                              ),
                            ),
                            // Chèn khoảng trống giữa id 11 và 12
                            // if (item.id == '7') const SizedBox(height: 8),
                            // if (item.id == '8') const SizedBox(height: 8),
                            // if (item.id == '9') const SizedBox(height: 8),
                            // if (item.id == '10') const SizedBox(height: 8),
                            if (item.id == '11') const SizedBox(height: 43),
                            // if (item.id == '12') const SizedBox(height: 5),
                            // if (item.id == '12') const SizedBox(height: 5),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              //
              //
              //
              Positioned(
                  top: 15,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    height: 585,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  top: 600,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: 2,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    height: 585,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
              //
              //
              //
              Positioned(
                top: -30,
                left: -20,
                child: Image.asset(
                  'assets/images/black_paint.png',
                  color: Colors.white,
                  height: 100,
                  width: 140,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              Positioned(
                top: 5,
                left: 15,
                child: Text(
                  'Vorspeise',
                  style: getFont0(state),
                ),
              ),
              //
              //
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
