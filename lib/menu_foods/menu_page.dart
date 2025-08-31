// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_1.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_2.dart';
import 'package:puzzel/menu_foods/pdf/pdf_generator.dart';

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
    return Scaffold(
      body: RepaintBoundary(
        key: _globalKey,
        // Truyền PageController vào DataWidget
        child: DataWidget(pageController: _pageController),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
            ],
          ),
          ElevatedButton(
            onPressed: () {
              captureAndSaveImage(_globalKey);
            },
            child: const Text("Xuất thành Image"),
          )
        ],
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
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(left: 20, top: 20),
      width: 400,
      height: 800,
      child: PageView(
        // Sử dụng pageController đã được truyền từ trên xuống
        controller: widget.pageController,
        scrollDirection: Axis.horizontal,
        children: [
          PageMenu1(),
          PageMenu2(),
        ],
      ),
    );
  }
}
