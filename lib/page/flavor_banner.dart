import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/flavor/flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!FlavorConfig.isDev) return child;

    return Banner(
      message: "DEV",
      location: BannerLocation.topStart,
      color: Colors.red.withOpacity(0.8),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.0,
        letterSpacing: 1.0,
      ),
      child: child,
    );
  }
}