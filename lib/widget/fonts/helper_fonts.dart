import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';

TextStyle getFont(
  AppFont font, {
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
}) {
  TextStyle baseStyle;

  switch (font) {
    case AppFont.greatVibes:
      baseStyle = GoogleFonts.greatVibes(fontSize: fontSize);
      break;
    case AppFont.gelasio:
      baseStyle = GoogleFonts.gelasio(fontSize: fontSize);
      break;
    case AppFont.openSans:
      baseStyle = GoogleFonts.openSans(fontSize: fontSize);
      break;
    case AppFont.roboto:
      baseStyle = GoogleFonts.roboto(fontSize: fontSize);
      break;
    case AppFont.lato:
      baseStyle = GoogleFonts.lato(fontSize: fontSize);
      break;
  }

  // Luôn override fontWeight và fontStyle
  return baseStyle.copyWith(
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}
