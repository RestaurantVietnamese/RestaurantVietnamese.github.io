// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_4.dart';
import 'package:puzzel/menu_foods/edit_data/edit_prices.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu4 extends StatefulWidget {
  const PageMenu4({super.key});

  @override
  State<PageMenu4> createState() => _PageMenu4State();
}

class _PageMenu4State extends State<PageMenu4> {
  @override
  Widget build(BuildContext context) {
    return 
    // InteractiveViewer(
    //   boundaryMargin: EdgeInsets.all(100),
    //   minScale: 0.1, // zoom nhỏ hơn để vừa khung
    //   maxScale: 3.0,
    //   child: 
      Container(
          color: bBg,
        child: FittedBox(
          fit: BoxFit.contain, // scale toàn bộ nội dung vừa khung
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 10),
                    SizedBox(height: 8),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    // SizedBox(height: 10),
        
                    Expanded(
                      child: Column(
                        children: menuItems_Page4.map((item) {
                          Widget widgetItem;
        
                          widgetItem = MenuItemWidget7(
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
        
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 30),
                                  child: widgetItem,
                                ),
                              ),
        
                              // // Điều kiện chèn khoảng trống giữa các item
                              // if (item.id == '5') SizedBox(height: 15),
                              // if (item.id == '6') SizedBox(height: 8),
        
                              // // Thêm logic khoảng cách giữa 11 và 12
                              if (item.id == '18') SizedBox(height: 8),
                              if (item.id == '19') SizedBox(height: 8),
                              if (item.id == '20') SizedBox(height: 8),
                              if (item.id == '21') SizedBox(height: 10),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
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
                    height: 765,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  top: 780,
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
                    height: 765,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        // ),
            ),
      );
  }
}
