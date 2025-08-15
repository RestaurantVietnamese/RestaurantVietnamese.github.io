import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/utils/widgets/app_colors.dart';

class TextRequired extends StatelessWidget {
  final String text;
  final bool isRequired;
  const TextRequired({Key? key, required this.text, this.isRequired = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.black),
          children: [
            TextSpan(
                text: isRequired ? " *" : '',
                style: TextStyle(color: AppColors.red))
          ]),
    );
  }
}

class TextNoneRequired extends StatelessWidget {
  final String text;
  final double? fontSize;
  const TextNoneRequired({Key? key, required this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.black, fontSize: fontSize),
    );
  }
}
