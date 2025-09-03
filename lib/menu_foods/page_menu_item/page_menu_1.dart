// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
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
                heightImage: 100,
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        'Supper',
                        style: getFont0(state),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '300 ml',
                          style: getFontB(state, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '750 ml',
                          style: getFontB(state, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: menuItems_Page1.map((item) {
                        Widget widgetItem;

                        if (item.id == '3' || item.id == '6') {
                          widgetItem = MenuItemWidget2(
                            item: item,
                          );
                        } else {
                          widgetItem = MenuItemWidget(item: item);
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
                            if (item.id == '5') SizedBox(height: 6),
                            if (item.id == '6') SizedBox(height: 10),
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
