import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';

TextStyle getFontByName(
  String fontName, {
  double fontSize = 14,
  Color? color,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
}) {
  final fontMap = GoogleFonts.asMap();
  final builder = fontMap[fontName];

  if (builder != null) {
    return builder(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }

  // fallback nếu font không tồn tại
  return GoogleFonts.roboto(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

extension AppFontX on AppFont {
  String get fontName {
    switch (this) {
      case AppFont.greatVibes:
        return 'Great Vibes';
      case AppFont.gelasio:
        return 'Gelasio';
      case AppFont.openSans:
        return 'Open Sans';
      case AppFont.roboto:
        return 'Roboto';
      case AppFont.lato:
        return 'Lato';
    }
  }
}
//--------------------

TextStyle getFont0(FontState state,
    {FontWeight fontWeight = FontWeight.normal,
    Color? color,
    FontStyle fontStyle = FontStyle.normal}) {
  return getFontByName(
    state.font0,
    fontSize: state.size0,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle getFontA(FontState state,
    {FontWeight fontWeight = FontWeight.w500,
    Color? color,
    FontStyle fontStyle = FontStyle.italic}) {
  return getFontByName(
    state.fontA,
    fontSize: state.sizeA,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle getFontB(FontState state,
    {FontWeight fontWeight = FontWeight.w600,
    Color? color,
    FontStyle fontStyle = FontStyle.normal}) {
  return getFontByName(
    state.fontB,
    fontSize: state.sizeB,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle getFontC(FontState state,
    {FontWeight fontWeight = FontWeight.w400,
    Color? color,
    FontStyle fontStyle = FontStyle.italic}) {
  return getFontByName(
    state.fontC,
    fontSize: state.sizeC,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle getFontD(FontState state,
    {FontWeight fontWeight = FontWeight.w600,
    Color? color,
    FontStyle fontStyle = FontStyle.normal}) {
  return getFontByName(
    state.fontD,
    fontSize: state.sizeD,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}
