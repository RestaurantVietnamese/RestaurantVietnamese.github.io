// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/export_image/save_image_util.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_1.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_2.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_3.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey _globalKey = GlobalKey();
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Scaffold(
        body: RepaintBoundary(
          key: _globalKey,
          // Truyền PageController vào DataWidget
          child: DataWidget(pageController: _pageController),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  DropdownButton<AppFont>(
                    value: state.font0,
                    underline: SizedBox(), // bỏ gạch chân
                    icon: Icon(Icons.font_download, color: Colors.red),
                    items: AppFont.values
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font.name),
                            ))
                        .toList(),
                    onChanged: (font) {
                      if (font != null)
                        context.read<FontCubit>().changeFont0(font);
                    },
                  ),
                  DropdownButton<AppFont>(
                    value: state.fontA,
                    underline: SizedBox(), // bỏ gạch chân
                    icon: Icon(Icons.font_download, color: Colors.red),
                    items: AppFont.values
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font.name),
                            ))
                        .toList(),
                    onChanged: (font) {
                      if (font != null)
                        context.read<FontCubit>().changeFontA(font);
                    },
                  ),
                  DropdownButton<AppFont>(
                    value: state.fontB,
                    underline: SizedBox(), // bỏ gạch chân
                    icon: Icon(Icons.font_download, color: Colors.red),
                    items: AppFont.values
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font.name),
                            ))
                        .toList(),
                    onChanged: (font) {
                      if (font != null)
                        context.read<FontCubit>().changeFontB(font);
                    },
                  ),
                  DropdownButton<AppFont>(
                    value: state.fontC,
                    underline: SizedBox(), // bỏ gạch chân
                    icon: Icon(Icons.font_download, color: Colors.red),
                    items: AppFont.values
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font.name),
                            ))
                        .toList(),
                    onChanged: (font) {
                      if (font != null)
                        context.read<FontCubit>().changeFontC(font);
                    },
                  ),
                  DropdownButton<AppFont>(
                    value: state.fontD,
                    underline: SizedBox(), // bỏ gạch chân
                    icon: Icon(Icons.font_download, color: Colors.red),
                    items: AppFont.values
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font.name),
                            ))
                        .toList(),
                    onChanged: (font) {
                      if (font != null)
                        context.read<FontCubit>().changeFontD(font);
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveImage(_globalKey);
              },
              child: const Text("Lưu ảnh"),
            )
          ],
        ),
      ),
    );
  }
}

class DataWidget extends StatefulWidget {
  // Thêm thuộc tính pageController
  final PageController pageController;
  const DataWidget({
    super.key,
    required this.pageController,
  });

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 5, right: 5),
      // margin: EdgeInsets.only(left: 20, top: 20),
      width: 410,
      height: 800,
      child: PageView(
        // Sử dụng pageController đã được truyền từ trên xuống
        controller: widget.pageController,
        scrollDirection: Axis.horizontal,
        children: [
          PageMenu3(),
          PageMenu2(),
          PageMenu1(),
        ],
      ),
    );
  }
}
