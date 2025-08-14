import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_state.dart';
import 'package:restaurant_with_frog_api/features/auth/view/verify_otp_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  void _register() {
    context.read<AuthCubit>().register(
          email: emailController.text.trim(),
          password: passwordController.text,
          username: usernameController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng ký')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthRegistered) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đăng ký thành công')),
              );
              // Navigator.pop(context); // Quay lại trang login
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyOtpScreen(
                      email: emailController.text.trim(),
                    ),
                  ));
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration:
                      const InputDecoration(labelText: 'Tên người dùng'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Mật khẩu'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _register,
                        child: const Text('Đăng ký'),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
