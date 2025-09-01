import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';

// Enum các font
enum AppFont { greatVibes, gelasio, openSans, roboto, lato }

class FontCubit extends Cubit<FontState> {
  FontCubit()
      : super(FontState(
          font0: AppFont.greatVibes,
          fontA: AppFont.gelasio,
          fontB: AppFont.openSans,
          fontC: AppFont.roboto,
          fontD: AppFont.lato,
          size0: 20,
          sizeA: 18,
          sizeB: 12,
          sizeC: 12,
          sizeD: 12,
        ));

  void changeFont0(AppFont font) => emit(FontState(
        font0: font,
        fontA: state.fontA,
        fontB: state.fontB,
        fontC: state.fontC,
        fontD: state.fontD,
        size0: state.size0,
        sizeA: state.sizeA,
        sizeB: state.sizeB,
        sizeC: state.sizeC,
        sizeD: state.sizeD,
      ));
  void changeFontA(AppFont font) => emit(FontState(
        font0: state.font0,
        fontA: font,
        fontB: state.fontB,
        fontC: state.fontC,
        fontD: state.fontD,
        size0: state.size0,
        sizeA: state.sizeA,
        sizeB: state.sizeB,
        sizeC: state.sizeC,
        sizeD: state.sizeD,
      ));

  void changeFontB(AppFont font) => emit(FontState(
        font0: state.font0,
        fontA: state.fontA,
        fontB: font,
        fontC: state.fontC,
        fontD: state.fontD,
        size0: state.size0,
        sizeA: state.sizeA,
        sizeB: state.sizeB,
        sizeC: state.sizeC,
        sizeD: state.sizeD,
      ));

  void changeFontC(AppFont font) => emit(FontState(
        font0: state.font0,
        fontA: state.fontA,
        fontB: state.fontB,
        fontC: font,
        fontD: state.fontD,
        size0: state.size0,
        sizeA: state.sizeA,
        sizeB: state.sizeB,
        sizeC: state.sizeC,
        sizeD: state.sizeD,
      ));

  void changeFontD(AppFont font) => emit(FontState(
        font0: state.font0,
        fontA: state.fontA,
        fontB: state.fontB,
        fontC: state.fontC,
        fontD: font,
        size0: state.size0,
        sizeA: state.sizeA,
        sizeB: state.sizeB,
        sizeC: state.sizeC,
        sizeD: state.sizeD,
      ));

  void changeSize0(double size) => emit(state.copyWith(size0: size));
  void changeSizeA(double size) => emit(state.copyWith(sizeA: size));
  void changeSizeB(double size) => emit(state.copyWith(sizeB: size));
  void changeSizeC(double size) => emit(state.copyWith(sizeC: size));
  void changeSizeD(double size) => emit(state.copyWith(sizeD: size));
}
