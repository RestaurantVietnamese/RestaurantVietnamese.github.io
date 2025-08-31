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
        ));

  void changeFont0(AppFont font) => emit(FontState(
        font0: font,
        fontA: state.fontA,
        fontB: state.fontB,
        fontC: state.fontC,
        fontD: state.fontD,
      ));
  void changeFontA(AppFont font) => emit(FontState(
        font0: state.font0,
        fontA: font,
        fontB: state.fontB,
        fontC: state.fontC,
        fontD: state.fontD,
      ));

  void changeFontB(AppFont font) => emit(FontState(
      font0: state.font0,
        fontA: state.fontA,
        fontB: font,
        fontC: state.fontC,
        fontD: state.fontD,
      ));

  void changeFontC(AppFont font) => emit(FontState(
      font0: state.font0,
        fontA: state.fontA,
        fontB: state.fontB,
        fontC: font,
        fontD: state.fontD,
      ));

  void changeFontD(AppFont font) => emit(FontState(
      font0: state.font0,
        fontA: state.fontA,
        fontB: state.fontB,
        fontC: state.fontC,
        fontD: font,
      ));
}
