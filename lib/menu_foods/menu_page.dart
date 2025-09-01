// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data_widget.dart';
import 'package:puzzel/menu_foods/export_image/save_image_util.dart';
import 'package:puzzel/widget/fonts/AppFontsGoogle.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/fontConfigs.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey _globalKey = GlobalKey();
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final fonts = GoogleFonts.asMap().keys.toList();
    // final formatted = fonts.map((f) => '"$f"').join(', ');

    // print('[$formatted]');
  }

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
                                      Text('Chọn Font & Size',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                      const SizedBox(height: 16),
                                      ...fontConfigs.map((config) {
                                        final fontName = (config['getFont']
                                            as String Function(
                                                FontState))(state);
                                        final size = (config['getSize']
                                            as double Function(
                                                FontState))(state);

                                        return _buildFontSetting(
                                          title: config['title'] as String,
                                          fontName: fontName,
                                          size: size,
                                          onFontChanged: (font) {
                                            if (font != null) {
                                              (config['onFontChanged']
                                                  as void Function(BuildContext,
                                                      String))(context, font);
                                            }
                                          },
                                          onSizeChanged: (newSize) {
                                            (config['onSizeChanged']
                                                as void Function(BuildContext,
                                                    double))(context, newSize);
                                          },
                                        );
                                      }).toList(),
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
    required String fontName,
    required double size,
    required ValueChanged<String?> onFontChanged,
    required ValueChanged<double> onSizeChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Row(
              children: [
                Text(fontName, style: GoogleFonts.getFont(fontName)),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.red),
                  onPressed: () {
                    _showFontSearch(context, fontName, (selectedFont) {
                      onFontChanged(selectedFont);
                    });
                  },
                ),
              ],
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

  Future<void> _showFontSearch(
    BuildContext context,
    String currentFont,
    Function(String) onSelected,
  ) async {
    String query = '';
    List<String> filteredFonts = [];

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5, // Chỉ chiếm 50% màn hình
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search font...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        query = value.toLowerCase();
                        setState(() {
                          if (query.isEmpty) {
                            filteredFonts = [];
                          } else {
                            filteredFonts = AppFontsGoogle.allFonts
                                .where((font) =>
                                    font.toLowerCase().contains(query))
                                .take(50)
                                .toList();
                          }
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: filteredFonts.isEmpty
                          ? Center(child: Text('Nhập từ khóa để tìm font'))
                          : ListView.separated(
                              itemCount: filteredFonts.length,
                              separatorBuilder: (_, __) => Divider(),
                              itemBuilder: (context, index) {
                                final fontName = filteredFonts[index];
                                return ListTile(
                                  title: Text(
                                    fontName,
                                    style: GoogleFonts.getFont(fontName),
                                  ),
                                  trailing: fontName == currentFont
                                      ? Icon(Icons.check, color: Colors.green)
                                      : null,
                                  onTap: () {
                                    onSelected(fontName);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
