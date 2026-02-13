import 'package:flutter/material.dart';

class ImagePageDash extends StatefulWidget {
  ImagePageDash({super.key});

  @override
  State<ImagePageDash> createState() => _ImagePageDashState();
}

class _ImagePageDashState extends State<ImagePageDash> {
  final List<String> images = const [
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
    'assets/images/img_1.jpg',
  ];

  int _layoutIndex = 1;

  void nextLayout() {
    setState(() {
      _layoutIndex++;
      if (_layoutIndex > 30) {
        _layoutIndex = 1;
      }
    });

    print(_layoutIndex);
  }

  final TransformationController _controller = TransformationController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;

      final scaleX = screenSize.width / 600;
      final scaleY = screenSize.height / 800;
      final initialScale = scaleX < scaleY ? scaleX : scaleY;

      _controller.value = Matrix4.identity()..scale(initialScale);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Tính scale để fit toàn bộ 600x800 vào màn hình
    final scaleX = screenSize.width / 600;
    final scaleY = screenSize.height / 800;
    final initialScale = scaleX < scaleY ? scaleX : scaleY;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextLayout();
        },
        child: const Icon(Icons.refresh),
      ),
      body: InteractiveViewer(
        transformationController: _controller,
        minScale: 0.05,
        maxScale: 4,
        boundaryMargin: const EdgeInsets.all(200),
        child: Container(
          width: 600,
          height: 800,
          decoration: const BoxDecoration(
            color: Color(0xFF5A4F45),
          ),
          child: Stack(
            children: _buildLayout(_layoutIndex),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLayout(int index) {
    final layouts = [
      _layout1(),
      _layout2(),
      _layout3(),
      _layout4(),
      _layout5(),
      _layout6(),
      _layout7(),
      _layout8(),
      _layout9(),
      _layout10(),
      _layout11(),
      _layout12(),
      _layout13(),
      _layout14(),
      _layout15(),
      _layout16(),
      _layout17(),
      _layout18(),
      _layout19(),
      _layout20(),
      _layout21(),
      _layout22(),
      _layout23(),
      _layout24(),
      _layout25(),
      _layout26(),
      _layout27(),
      _layout28(),
      _layout29(),
      _layout30(),
    ];

    return layouts[(index - 1) % layouts.length];
  }

  Widget _bowl(double left, double top, double size, int index,
      {bool isHero = false}) {
    if (index >= images.length) return const SizedBox();

    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(images[index]),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: isHero ? 40 : 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================
  List<Widget> _layout1() => [
        _bowl(450, 30, 120, 0),
        _bowl(360, 140, 150, 1),
        _bowl(180, 260, 260, 2, isHero: true),
        _bowl(100, 490, 170, 3),
        _bowl(20, 640, 140, 4),
      ];

  List<Widget> _layout2() => [
        _bowl(250, 270, 260, 2, isHero: true),
        _bowl(150, 160, 150, 0),
        _bowl(430, 170, 140, 1),
        _bowl(160, 500, 160, 3),
        _bowl(380, 520, 140, 4),
      ];

  List<Widget> _layout3() => [
        _bowl(180, 250, 260, 2, isHero: true),
        _bowl(240, 100, 130, 0),
        _bowl(450, 300, 140, 1),
        _bowl(20, 300, 150, 3),
        _bowl(240, 520, 140, 4),
      ];

  List<Widget> _layout4() => [
        _bowl(240, 20, 140, 0),
        _bowl(320, 160, 160, 1),
        _bowl(100, 290, 260, 2, isHero: true),
        _bowl(320, 510, 150, 3),
        _bowl(200, 650, 130, 4),
      ];

  List<Widget> _layout5() => [
        _bowl(60, 20, 180, 0),
        _bowl(140, 180, 200, 1),
        _bowl(80, 380, 260, 2, isHero: true),
        _bowl(200, 630, 160, 3),
        _bowl(40, 610, 130, 4),
      ];

  List<Widget> _layout6() => [
        _bowl(80, 100, 160, 0),
        _bowl(340, 120, 150, 1),
        _bowl(200, 300, 260, 2, isHero: true),
        _bowl(100, 540, 160, 3),
        _bowl(380, 580, 150, 4),
      ];

  List<Widget> _layout7() => [
        _bowl(100, 80, 150, 0),
        _bowl(260, 160, 180, 1),
        _bowl(180, 360, 260, 2, isHero: true),
        _bowl(360, 610, 150, 3),
      ];

  List<Widget> _layout8() => [
        _bowl(250, 50, 160, 0),
        _bowl(120, 190, 150, 1),
        _bowl(360, 210, 180, 2),
        _bowl(200, 370, 260, 3, isHero: true),
        _bowl(250, 650, 130, 4),
      ];

  List<Widget> _layout9() => [
        _bowl(80, 80, 140, 0),
        _bowl(380, 100, 140, 1),
        _bowl(200, 250, 260, 2, isHero: true),
        _bowl(100, 600, 150, 3),
        _bowl(360, 620, 150, 4),
      ];

  List<Widget> _layout10() => [
        _bowl(200, 50, 180, 0),
        _bowl(100, 210, 150, 1),
        _bowl(350, 210, 150, 2),
        _bowl(200, 370, 260, 3, isHero: true),
        _bowl(240, 650, 130, 4),
      ];

  List<Widget> _layout11() => [
        _bowl(60, 200, 150, 0),
        _bowl(400, 200, 150, 1),
        _bowl(250, 300, 280, 2, isHero: true),
        _bowl(120, 600, 140, 3),
        _bowl(380, 650, 140, 4),
      ];

  List<Widget> _layout12() => [
        _bowl(200, 60, 140, 0),
        _bowl(380, 180, 160, 1),
        _bowl(100, 220, 160, 2),
        _bowl(200, 360, 260, 3, isHero: true),
        _bowl(260, 650, 150, 4),
      ];

  List<Widget> _layout13() => [
        _bowl(150, 60, 150, 0),
        _bowl(300, 60, 150, 1),
        _bowl(220, 200, 200, 2),
        _bowl(200, 400, 260, 3, isHero: true),
        _bowl(200, 650, 120, 4),
      ];

  List<Widget> _layout14() => [
        _bowl(60, 80, 140, 0),
        _bowl(200, 160, 170, 1),
        _bowl(380, 260, 170, 2),
        _bowl(160, 380, 260, 3, isHero: true),
      ];

  List<Widget> _layout15() => [
        _bowl(250, 120, 160, 0),
        _bowl(120, 260, 160, 1),
        _bowl(350, 260, 160, 2),
        _bowl(200, 420, 280, 3, isHero: true),
        _bowl(220, 720, 120, 4),
      ];

  List<Widget> _layout16() => [
        _bowl(100, 100, 160, 0),
        _bowl(340, 150, 140, 1),
        _bowl(200, 300, 260, 2, isHero: true),
        _bowl(120, 580, 150, 3),
        _bowl(380, 620, 140, 4),
      ];

  List<Widget> _layout17() => [
        _bowl(250, 60, 150, 0),
        _bowl(100, 220, 150, 1),
        _bowl(380, 220, 150, 2),
        _bowl(200, 380, 260, 3, isHero: true),
        _bowl(250, 700, 120, 4),
      ];

  List<Widget> _layout18() => [
        _bowl(170, 70, 150, 0),
        _bowl(350, 90, 150, 1),
        _bowl(250, 240, 200, 2),
        _bowl(200, 460, 280, 3, isHero: true),
      ];

  List<Widget> _layout19() => [
        _bowl(60, 140, 150, 0),
        _bowl(400, 160, 150, 1),
        _bowl(200, 300, 280, 2, isHero: true),
        _bowl(100, 620, 140, 3),
        _bowl(360, 650, 140, 4),
      ];

  List<Widget> _layout20() => [
        _bowl(250, 50, 150, 0),
        _bowl(100, 190, 160, 1),
        _bowl(380, 210, 160, 2),
        _bowl(200, 350, 300, 3, isHero: true),
        _bowl(200, 640, 120, 4),
      ];

  List<Widget> _layout21() => [
        _bowl(170, 270, 260, 0, isHero: true), // hero
        _bowl(235, 120, 130, 1),
        _bowl(235, 550, 130, 2),
        _bowl(40, 335, 130, 3),
        _bowl(430, 335, 130, 4),
      ];

  List<Widget> _layout22() => [
        _bowl(80, 70, 130, 0),
        _bowl(280, 90, 150, 1),
        _bowl(140, 230, 150, 2),
        _bowl(220, 350, 280, 3, isHero: true),
        _bowl(300, 650, 120, 4),
      ];

  List<Widget> _layout23() => [
        _bowl(170, 300, 260, 0, isHero: true),
        _bowl(235, 80, 130, 1),
        _bowl(60, 380, 130, 2),
        _bowl(430, 380, 130, 3),
        _bowl(235, 600, 130, 4),
      ];

  List<Widget> _layout24() => [
        _bowl(230, 60, 130, 0),
        _bowl(320, 180, 130, 1),
        _bowl(170, 310, 260, 2, isHero: true),
        _bowl(410, 500, 130, 3),
        _bowl(230, 630, 130, 4),
      ];

  List<Widget> _layout25() => [
        _bowl(80, 20, 120, 0),
        _bowl(140, 130, 140, 1),
        _bowl(80, 280, 260, 2, isHero: true),
        _bowl(140, 550, 130, 3),
        _bowl(100, 680, 110, 4),
      ];

  List<Widget> _layout26() => [
        _bowl(230, 80, 130, 0),
        _bowl(80, 220, 130, 1),
        _bowl(170, 340, 260, 2, isHero: true),
        _bowl(390, 220, 130, 3),
        _bowl(230, 600, 130, 4),
      ];

  List<Widget> _layout27() => [
        _bowl(160, 120, 130, 0),
        _bowl(310, 120, 130, 1),
        _bowl(60, 280, 130, 2),
        _bowl(175, 320, 260, 3, isHero: true),
        _bowl(420, 280, 130, 4),
      ];

  List<Widget> _layout28() => [
        _bowl(180, 250, 260, 2, isHero: true),
        _bowl(240, 100, 130, 0),
        _bowl(450, 340, 140, 1),
        _bowl(20, 340, 150, 3),
        _bowl(390, 520, 140, 4),
        _bowl(90, 520, 140, 5),
      ];
  List<Widget> _layout29() => [
        _bowl(80, 170, 130, 0),
        _bowl(450, 340, 140, 1),
        _bowl(180, 250, 260, 2, isHero: true),
        _bowl(20, 340, 150, 3),
        _bowl(390, 520, 140, 4),
        _bowl(90, 520, 140, 5),
        _bowl(410, 170, 130, 6),
      ];

  List<Widget> _layout30() => [
        _bowl(60, 260, 140, 0),
        _bowl(200, 160, 170, 1),
        _bowl(380, 80, 170, 2),
        _bowl(160, 380, 260, 3, isHero: true),
      ];
}
