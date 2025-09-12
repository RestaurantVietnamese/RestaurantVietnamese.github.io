// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
import 'package:puzzel/menu_foods/edit_data/edit_prices.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_2.dart';
import 'package:puzzel/widget/change_image_background/PositionedImageChangeBackGround.dart';
import 'package:puzzel/widget/change_image_background/show_dialog_change_image.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu1 extends StatefulWidget {
  const PageMenu1({
    super.key,
  });

  @override
  State<PageMenu1> createState() => _PageMenu1State();
}

class _PageMenu1State extends State<PageMenu1> {
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

  // 👇 Thêm hàm này để sửa giá

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
              PositionedImageChangeBackGround(
                imageUrl: imageUrl,
                heightImage: 106,
              ),
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
                  'Suppen',
                  style: getFont0(state),
                ),
              ),
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 0.1)),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 42),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 0),
                    //   child: Text(
                    //     'Supper',
                    //     style: getFont0(state),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          '300 ml',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          // style: getFontB(
                          //   state,
                          //   fontWeight: FontWeight.w800,
                          // ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          '750 ml',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),

                          // style: getFontB(state, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    // SizedBox(height: 5),
                    Column(
                      children: menuItems_Page1.map((item) {
                        Widget widgetItem;

                        if (item.id == '3' || item.id == '6') {
                          widgetItem = MenuItemWidget2(
                            item: item,
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
                            onEditDescription: (item, isDescriptionDe) =>
                                editDescription(
                              context: context,
                              item: item,
                              isDescriptionDe: isDescriptionDe,
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
                                  if (item.id == '6') _pickImage();
                                },
                                child: Container(
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: Colors.transparent),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: widgetItem,
                                ),
                              ),
                            ),
                            // if (item.id == '1') SizedBox(height: 5),
                            // if (item.id == '2') SizedBox(height: 5),
                            // if (item.id == '3') SizedBox(height: 5),
                            // if (item.id == '4') SizedBox(height: 5),
                            if (item.id == '5') SizedBox(height: 15),
                            // if (item.id == '6') SizedBox(height: 5),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
