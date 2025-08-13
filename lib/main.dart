// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/features/auth/view/splash_page.dart';
import 'package:restaurant_with_frog_api/flavor/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: FlavorBanner(child: SplashPage()),
      ),
    );
  }
}

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
