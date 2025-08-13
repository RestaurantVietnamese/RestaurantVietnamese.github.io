import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/features/auth/view/login_page_mobile.dart';
import 'package:restaurant_with_frog_api/utils/responsive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    context.read<AuthCubit>().login(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: LoginPageMobile(
        emailController: emailController,
        passwordController: passwordController,
        onLogin: () => _login(context),
      ),
      tablet: LoginPageMobile(
        emailController: emailController,
        passwordController: passwordController,
        onLogin: () => _login(context),
      ),
      web: LoginPageMobile(
        emailController: emailController,
        passwordController: passwordController,
        onLogin: () => _login(context),
      ),
    );
  }
}
