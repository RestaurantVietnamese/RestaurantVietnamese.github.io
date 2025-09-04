import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';

// Enum các font
enum AppFont { greatVibes, gelasio, openSans, roboto, lato }

class FontCubit extends Cubit<FontState> {
  FontCubit()
      : super(FontState(
          font0: 'Great Vibes',
          fontA: 'Gelasio',
          fontB: 'Open Sans',
          fontC: 'Roboto',
          fontD: 'Lato',
          size0: 22,
          sizeA: 20,
          sizeB: 12,
          sizeC: 12,
          sizeD: 12,
        ));

  // Thay đổi font (String)
  void changeFont0(String font) => emit(state.copyWith(font0: font));
  void changeFontA(String font) => emit(state.copyWith(fontA: font));
  void changeFontB(String font) => emit(state.copyWith(fontB: font));
  void changeFontC(String font) => emit(state.copyWith(fontC: font));
  void changeFontD(String font) => emit(state.copyWith(fontD: font));

  // Thay đổi size
  void changeSize0(double size) => emit(state.copyWith(size0: size));
  void changeSizeA(double size) => emit(state.copyWith(sizeA: size));
  void changeSizeB(double size) => emit(state.copyWith(sizeB: size));
  void changeSizeC(double size) => emit(state.copyWith(sizeC: size));
  void changeSizeD(double size) => emit(state.copyWith(sizeD: size));
}
