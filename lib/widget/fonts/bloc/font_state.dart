// State chứa font cho mỗi Text
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';

class FontState {
  final AppFont font0;
  final AppFont fontA;
  final AppFont fontB;
  final AppFont fontC;
  final AppFont fontD;

  final double size0;
  final double sizeA;
  final double sizeB;
  final double sizeC;
  final double sizeD;

  FontState({
    required this.font0,
    required this.fontA,
    required this.fontB,
    required this.fontC,
    required this.fontD,
    required this.size0,
    required this.sizeA,
    required this.sizeB,
    required this.sizeC,
    required this.sizeD,
  });

  FontState copyWith({
    AppFont? font0,
    AppFont? fontA,
    AppFont? fontB,
    AppFont? fontC,
    AppFont? fontD,
    double? size0,
    double? sizeA,
    double? sizeB,
    double? sizeC,
    double? sizeD,
  }) {
    return FontState(
      font0: font0 ?? this.font0,
      fontA: fontA ?? this.fontA,
      fontB: fontB ?? this.fontB,
      fontC: fontC ?? this.fontC,
      fontD: fontD ?? this.fontD,
      size0: size0 ?? this.size0,
      sizeA: sizeA ?? this.sizeA,
      sizeB: sizeB ?? this.sizeB,
      sizeC: sizeC ?? this.sizeC,
      sizeD: sizeD ?? this.sizeD,
    );
  }
}
