import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_state.dart';
import 'package:restaurant_with_frog_api/server/restaurant_service.dart';
import 'package:restaurant_with_frog_api/features/auth/models/user.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    checkAuthentication(); // Gọi khi Cubit được tạo
  }

  final _storage = const FlutterSecureStorage();

  User? _user;
  String? _accessToken;
  String? _refreshToken;

  User? get currentUser => _user;

  Future<void> checkAuthentication() async {
    emit(AuthLoading());

    try {
      _accessToken = await _storage.read(key: 'accessToken');
      _refreshToken = await _storage.read(key: 'refreshToken');

      if (_accessToken == null || _refreshToken == null) {
        emit(AuthUnauthenticated());
        return;
      }

      // Nếu có accessToken nhưng không có user => gọi refresh API
      final result = await RestaurantService.refreshToken(_refreshToken!);
      _accessToken = result['accessToken'];

      final storedUserJson = await _storage.read(key: 'user');
      if (storedUserJson != null) {
        _user = User.fromJson(jsonDecode(storedUserJson));
        emit(AuthAuthenticated(_user!));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await RestaurantService.login(
        email: email,
        password: password,
      );

      _accessToken = result['accessToken'];
      _refreshToken = result['refreshToken'];
      _user = User.fromJson(result['user']);

      await _storage.write(key: 'accessToken', value: _accessToken);
      await _storage.write(key: 'refreshToken', value: _refreshToken);
      await _storage.write(key: 'user', value: jsonEncode(_user!.toJson()));

      emit(AuthAuthenticated(_user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AuthLoading());
    try {
      await RestaurantService.register(
        email: email,
        password: password,
        username: username,
      );
      emit(AuthRegistered());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void logout() async {
    await _storage.deleteAll();
    _user = null;
    _accessToken = null;
    _refreshToken = null;
    emit(AuthUnauthenticated());
  }

  Future<void> verifyOTP({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());
    try {
      await RestaurantService.verifyOTP(
        email: email,
        otp: otp,
      );
      emit(AuthRegistered());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
