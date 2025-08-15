// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gcaptcha_v3/recaptca_config.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/flavor/flavor_config.dart';
import 'package:restaurant_with_frog_api/page/flavor_banner.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/recruitment_apply.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RecaptchaHandler.instance
      .setupSiteKey(dataSiteKey: FlavorConfig.captchaSiteKey);

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
        home: FlavorBanner(child: RecruitmentApply()),
      ),
    );
  }
}

// SplashPage()


