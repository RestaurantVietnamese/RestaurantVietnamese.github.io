import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/utils/widgets/app_colors.dart';
/// Button chính ở bottom của màn hình
class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? buttonColor;
  final Color textColor;
  final Color disableColor;
  final double radius;
  final double? width;
  final double? height;
  final String? icon;
  final bool disable;
  final bool isShowGradient;

  /// Dùng để cấu hình các action theo FeatureConfig
  final bool enableAction;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.radius = 8,
    this.enableAction = true,
    this.buttonColor,
    this.disableColor = AppColors.unActive,
    this.textColor = Colors.white,
    this.disable = false,
    this.isShowGradient = true,
    this.width,
    this.height,
    this.icon,
    this.padding,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height ?? 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: disable ? disableColor : (buttonColor ?? AppColors.primary),
      ),
      child: InkWell(
        onTap: disable ? null : onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    fontFamily: 'Lato-Bold',
                  ),
            ),
            // if (icon != null) ...[
            //   const SizedBox(width: 10),
            //   AppAssets.svgIcon(icon!, color: Colors.white),
            // ],
          ],
        ),
      ),
    );
  }
}

/// Nút có icon (ví dụ đăng nhập Google)
class CommonIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget icon;
  final Color? buttonColor;
  final double height;

  const CommonIconButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.height = 44,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: icon,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


