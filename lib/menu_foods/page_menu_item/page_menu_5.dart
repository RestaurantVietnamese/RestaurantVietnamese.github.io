// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_5.dart';
import 'package:puzzel/menu_foods/edit_data/edit_prices.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/widget/change_image_background/PositionedImageChangeBackGround.dart';
import 'package:puzzel/widget/change_image_background/show_dialog_change_image.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu5 extends StatefulWidget {
  const PageMenu5({super.key});

  @override
  State<PageMenu5> createState() => _PageMenu5State();
}

class _PageMenu5State extends State<PageMenu5> {
  String? imageUrl =
      'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg';

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
    return 
    // InteractiveViewer(
    //   boundaryMargin: EdgeInsets.all(100),
    //   minScale: 0.1, // zoom nhỏ hơn để vừa khung
    //   maxScale: 3.0,
    //   child: 
      FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
        child: Stack(
          children: [
            PositionedImageChangeBackGround(
              imageUrl: imageUrl,
              heightImage: 800,
            ),
            Container(
              width: 450,
              height: 800,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.1)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    color: aBg, // nền trắng cho toàn bộ danh sách
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: menuItems_Page5
                          .map((item) => Padding(
                                padding: EdgeInsets.only(
                                    top: item.id == '22' ? 15 : 0,
                                    bottom: item.id == '26'
                                        ? 5
                                        : 0), // spacing between items
                                child: GestureDetector(
                                    onTap: () {
                                      if (item.id == '26') {
                                        _pickImage();
                                      }
                                    },
                                    child: MenuItemWidget7(
                                      item: item,
                                      onEditPrice: (option, isPrice1) =>
                                          editPrice(
                                              context: context,
                                              option: option,
                                              isPrice1: isPrice1,
                                              setState: setState),
                                      onEditDescription:
                                          (item, isDescriptionDe) =>
                                              editDescription(
                                        context: context,
                                        item: item,
                                        isDescriptionDe: isDescriptionDe,
                                        setState: setState,
                                      ),
                                    )),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      // ),
    );
  }
}
