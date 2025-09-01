// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_2.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_3.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_4.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_5.dart';
import 'package:puzzel/widget/change_image_background/PositionedImageChangeBackGround.dart';
import 'package:puzzel/widget/change_image_background/show_dialog_change_image.dart';

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
    return Stack(
      children: [
        PositionedImageChangeBackGround(
          imageUrl: imageUrl,
          heightImage: 200,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10),
              // SizedBox(height: 10),
              // SizedBox(height: 10),
              // SizedBox(height: 10),
              Text(
                '',
                style: GoogleFonts.greatVibes(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '',
                    style: GoogleFonts.openSans(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 30),
                  Text(
                    '',
                    style: GoogleFonts.openSans(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    for (var i = 0; i < menuItems_Page2.length; i++) ...[
                      // Widget cho item hiện tại
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            // print(menuItems_Page2[i].id);
                            if (menuItems_Page2[i].id == '13') {
                              _pickImage();
                            }
                          },
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.transparent,
                              border: Border.all(color: Colors.transparent),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: (menuItems_Page2[i].id == '11' ||
                                    menuItems_Page2[i].id == '12' ||
                                    menuItems_Page2[i].id == '13')
                                ? MenuItemWidget3(
                                    item: menuItems_Page2[i],
                                    id: menuItems_Page2[i].id)
                                : menuItems_Page2[i].id == '8'
                                    ? MenuItemWidget4(item: menuItems_Page2[i])
                                    : (menuItems_Page2[i].id == '9' ||
                                            menuItems_Page2[i].id == '10')
                                        ? MenuItemWidget5(
                                            item: menuItems_Page2[i])
                                        : MenuItemWidget(
                                            item: menuItems_Page2[i]),
                          ),
                        ),
                      ),

                      // Chèn khoảng trống giữa id 11 và 12
                      if (menuItems_Page2[i].id == '11' &&
                          i + 1 < menuItems_Page2.length &&
                          menuItems_Page2[i + 1].id == '12')
                        const SizedBox(
                            height: 20), // <- thay 20 bằng height bạn muốn
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
