import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';

final fontConfigs = [
  {
    'title': 'Font 0',
    'getFont': (FontState state) => state.font0,
    'getSize': (FontState state) => state.size0,
    'onFontChanged': (BuildContext context, String font) =>
        context.read<FontCubit>().changeFont0(font),
    'onSizeChanged': (BuildContext context, double size) =>
        context.read<FontCubit>().changeSize0(size),
  },
  {
    'title': 'Font A',
    'getFont': (FontState state) => state.fontA,
    'getSize': (FontState state) => state.sizeA,
    'onFontChanged': (BuildContext context, String font) =>
        context.read<FontCubit>().changeFontA(font),
    'onSizeChanged': (BuildContext context, double size) =>
        context.read<FontCubit>().changeSizeA(size),
  },
  {
    'title': 'Font B',
    'getFont': (FontState state) => state.fontB,
    'getSize': (FontState state) => state.sizeB,
    'onFontChanged': (BuildContext context, String font) =>
        context.read<FontCubit>().changeFontB(font),
    'onSizeChanged': (BuildContext context, double size) =>
        context.read<FontCubit>().changeSizeB(size),
  },
  {
    'title': 'Font C',
    'getFont': (FontState state) => state.fontC,
    'getSize': (FontState state) => state.sizeC,
    'onFontChanged': (BuildContext context, String font) =>
        context.read<FontCubit>().changeFontC(font),
    'onSizeChanged': (BuildContext context, double size) =>
        context.read<FontCubit>().changeSizeC(size),
  },
  {
    'title': 'Font D',
    'getFont': (FontState state) => state.fontD,
    'getSize': (FontState state) => state.sizeD,
    'onFontChanged': (BuildContext context, String font) =>
        context.read<FontCubit>().changeFontD(font),
    'onSizeChanged': (BuildContext context, double size) =>
        context.read<FontCubit>().changeSizeD(size),
  },
];
