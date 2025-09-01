// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data_widget.dart';
import 'package:puzzel/menu_foods/export_image/save_image_util.dart';
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
                  ElevatedButton(
                    onPressed: () {
                      saveImage(_globalKey);
                    },
                    child: const Text("Lưu ảnh"),
                  ),
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
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.blue),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) {
                          return BlocBuilder<FontCubit, FontState>(
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Chọn Font & Size',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(height: 16),
                                      _buildFontSetting(
                                        title: 'Font 0',
                                        value: state.font0,
                                        size: state.size0,
                                        onFontChanged: (font) {
                                          if (font != null) {
                                            context
                                                .read<FontCubit>()
                                                .changeFont0(font);
                                          }
                                        },
                                        onSizeChanged: (size) {
                                          context
                                              .read<FontCubit>()
                                              .changeSize0(size);
                                        },
                                      ),
                                      _buildFontSetting(
                                        title: 'Font A',
                                        value: state.fontA,
                                        size: state.sizeA,
                                        onFontChanged: (font) {
                                          if (font != null) {
                                            context
                                                .read<FontCubit>()
                                                .changeFontA(font);
                                          }
                                        },
                                        onSizeChanged: (size) {
                                          context
                                              .read<FontCubit>()
                                              .changeSizeA(size);
                                        },
                                      ),
                                      _buildFontSetting(
                                        title: 'Font B',
                                        value: state.fontB,
                                        size: state.sizeB,
                                        onFontChanged: (font) {
                                          if (font != null) {
                                            context
                                                .read<FontCubit>()
                                                .changeFontB(font);
                                          }
                                        },
                                        onSizeChanged: (size) {
                                          context
                                              .read<FontCubit>()
                                              .changeSizeB(size);
                                        },
                                      ),
                                      _buildFontSetting(
                                        title: 'Font C',
                                        value: state.fontC,
                                        size: state.sizeC,
                                        onFontChanged: (font) {
                                          if (font != null) {
                                            context
                                                .read<FontCubit>()
                                                .changeFontC(font);
                                          }
                                        },
                                        onSizeChanged: (size) {
                                          context
                                              .read<FontCubit>()
                                              .changeSizeC(size);
                                        },
                                      ),
                                      _buildFontSetting(
                                        title: 'Font D',
                                        value: state.fontD,
                                        size: state.sizeD,
                                        onFontChanged: (font) {
                                          if (font != null) {
                                            context
                                                .read<FontCubit>()
                                                .changeFontD(font);
                                          }
                                        },
                                        onSizeChanged: (size) {
                                          context
                                              .read<FontCubit>()
                                              .changeSizeD(size);
                                        },
                                      ),
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFontSetting({
    required String title,
    required AppFont value,
    required double size,
    required ValueChanged<AppFont?> onFontChanged,
    required ValueChanged<double> onSizeChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            DropdownButton<AppFont>(
              value: value,
              underline: SizedBox(),
              icon: Icon(Icons.font_download, color: Colors.red),
              items: AppFont.values
                  .map((font) => DropdownMenuItem(
                        value: font,
                        child: Text(font.name),
                      ))
                  .toList(),
              onChanged: onFontChanged,
            ),
          ],
        ),
        Slider(
          value: size,
          min: 10,
          max: 50,
          divisions: 40,
          label: size.toStringAsFixed(0),
          onChanged: onSizeChanged,
        ),
      ],
    );
  }
  Widget _buildFontSetting2({
    required String title,
    required String fontName,
    required double size,
    required ValueChanged<String?> onFontChanged,
    required ValueChanged<double> onSizeChanged,
  }) {
    final fontNames = GoogleFonts.asMap().keys.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            DropdownButton<String>(
              value: fontName,
              underline: SizedBox(),
              icon: Icon(Icons.font_download, color: Colors.red),
              items: fontNames
                  .map((name) => DropdownMenuItem(
                        value: name,
                        child: Text(name, style: GoogleFonts.getFont(name)),
                      ))
                  .toList(),
              onChanged: onFontChanged,
            ),
          ],
        ),
        Slider(
          value: size,
          min: 10,
          max: 50,
          divisions: 40,
          label: size.toStringAsFixed(0),
          onChanged: onSizeChanged,
        ),
      ],
    );
  }
}
