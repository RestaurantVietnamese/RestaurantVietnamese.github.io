// login_page_mobile.dart
import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/utils/responsive.dart';
import 'package:restaurant_with_frog_api/features/auth/view/register_page.dart';

class LoginPageMobile extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const LoginPageMobile({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Mật khẩu'),
            obscureText: true,
          ),
          SizedBox(
            height: 16.h(context),
          ),
          ElevatedButton(
            onPressed: onLogin,
            child: const Text('Đăng nhập'),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterPage()),
              );
            },
            child: const Text('Chưa có tài khoản? Đăng ký'),
          ),
        ],
      ),
    );
  }
}
