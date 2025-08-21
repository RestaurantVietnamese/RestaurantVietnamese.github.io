import 'package:flutter/material.dart';

class QuestionTimerWithAnimal extends StatefulWidget {
  final int totalSeconds;
  final int remainingSeconds;

  const QuestionTimerWithAnimal({
    Key? key,
    required this.totalSeconds,
    required this.remainingSeconds,
  }) : super(key: key);

  @override
  _QuestionTimerWithAnimalState createState() =>
      _QuestionTimerWithAnimalState();
}

class _QuestionTimerWithAnimalState extends State<QuestionTimerWithAnimal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.totalSeconds),
    );

    _positionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    double initialProgress =
        1 - (widget.remainingSeconds / widget.totalSeconds);
    _controller.value = initialProgress;

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double numberWidth = 80;
    final double trackWidth = screenWidth - numberWidth - 20;
    final double animalWidth = 200;

    final double maxMove = trackWidth - animalWidth;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 200,
            color: Colors.white,
            child: AnimatedBuilder(
              animation: _positionAnimation,
              builder: (context, child) {
                double animalPosition = maxMove * _positionAnimation.value;
                return Stack(
                  children: [
                    Positioned(
                      left: animalPosition,
                      top: 0,
                      child: child!,
                    ),
                  ],
                );
              },
              child: Image.asset(
                'assets/images/time_gif_animation.gif',
                height: animalWidth,
                width: animalWidth,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '${widget.remainingSeconds}',
          style: TextStyle(
            fontSize: 50,
            color: widget.remainingSeconds <= 10 ? Colors.red : Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
