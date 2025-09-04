// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_8.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_9.dart';
import 'package:puzzel/widget/change_image_background/PositionedImageChangeBackGround.dart';
import 'package:puzzel/widget/change_image_background/show_dialog_change_image.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu7 extends StatefulWidget {
  const PageMenu7({super.key});

  @override
  State<PageMenu7> createState() => _PageMenu7State();
}

class _PageMenu7State extends State<PageMenu7> {
  String? imageUrl =
      'https://images.pexels.com/photos/25389777/pexels-photo-25389777.jpeg';

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
                heightImage: 400,
              ),
              //
              //
              //
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          for (var i = 0; i < menuItems_Page7.length; i++) ...[
                            // Widget cho item hiện tại
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: Colors.transparent),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: (menuItems_Page7[i].id == '32')
                                      ? MenuItemWidget8(
                                          item: menuItems_Page7[i],
                                          usePadding: false,
                                        )
                                      : (menuItems_Page7[i].id == '38')
                                          ? GestureDetector(
                                              onTap: () {
                                                if (menuItems_Page7[i].id ==
                                                    '38') {
                                                  _pickImage();
                                                }
                                              },
                                              child: MenuItemWidget7(
                                                item: menuItems_Page7[i],
                                                useLineHeight: false,
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                if (menuItems_Page7[i].id ==
                                                        '37' ||
                                                    menuItems_Page7[i].title ==
                                                        'Veggie Bowl') {
                                                  _pickImage();
                                                }
                                              },
                                              child: MenuItemWidget9(
                                                item: menuItems_Page7[i],
                                                usePadding: false,
                                                menuPage7: true,
                                              ),
                                            )),
                            ),
                            if (menuItems_Page7[i].title == 'Salmon Bowl')
                              SizedBox(height: 55),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //
              //
              //
              Positioned(
                top: 372,
                left: -60,
                child: Image.asset(
                  'assets/images/black_paint.png',
                  color: Colors.white,
                  height: 100,
                  width: 230,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              // Container(
              //     width: 220,
              //     height: 40,
              //     child: Image.asset(
              //       'assets/images/black_paint.png',
              //       color: Colors.white,
              //       fit: BoxFit.fitWidth,
              //       colorBlendMode: BlendMode.srcIn,
              //     ),
              //   )
              Positioned(
                top: 405,
                left: 5,
                child: Text(
                  'Vegan Main',
                  style: getFont0(state),
                ),
              ),
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
