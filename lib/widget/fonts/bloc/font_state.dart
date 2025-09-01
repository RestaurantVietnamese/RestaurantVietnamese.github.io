// State chứa font cho mỗi Text

class FontState {
  final String font0;
  final String fontA;
  final String fontB;
  final String fontC;
  final String fontD;

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
    String? font0,
    String? fontA,
    String? fontB,
    String? fontC,
    String? fontD,
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
