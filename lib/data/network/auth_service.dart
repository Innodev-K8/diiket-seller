import 'package:diiket_models/all.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(apiProvider));
});

class AuthService {
  Dio _dio;

  AuthService(this._dio);

  String _(Object path) => '/auth/$path';

  Future<AuthResponse> loginWithEmailPassword(
    String email,
    String password, [
    String? fcmToken,
  ]) async {
    try {
      final response = await _dio.post(
        _('login'),
        data: {
          'email': email,
          'password': password,
          'fcm_token': fcmToken,
          'device_name': 'mobile',
        },
      );

      final authResponse = AuthResponse.fromJson(response.data);

      if (authResponse.user?.type != UserType.driver) {
        throw CustomException(code: 403, message: 'Kredensial salah');
      }

      return authResponse;
    } on DioError catch (error) {
      print(error);
      throw CustomException.fromDioError(error);
    }
  }

  Future<AuthResponse> loginWithFirebaseToken(String token,
      [String? fcmToken]) async {
    try {
      print('login with fcmtoken: $fcmToken');
      
      final response = await _dio.post(
        _('login/firebase'),
        data: {
          'firebase_token': token,
          'device_name': 'mobile',
          'signin_only': true,
          if (fcmToken != null) 'fcm_token': fcmToken,
        },
      );

      final authResponse = AuthResponse.fromJson(response.data);

      if (authResponse.user?.type != UserType.seller) {
        throw CustomException(
          code: 403,
          message: 'Nomor tidak terdaftar sebagai pedagang.',
        );
      }

      return authResponse;
    } on DioError catch (error) {
      if (error.response?.statusCode == 401) {
        throw CustomException(
          code: 401,
          message: 'Nomor tidak terdaftar.',
        );
      }

      throw CustomException.fromDioError(error);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(_('logout'));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<User?> me() async {
    try {
      final response = await _dio.get(_('me'));

      return User.fromJson(response.data['data']);
    } catch (_) {
      return null;
    }
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    try {
      data.putIfAbsent('_method', () => 'PATCH');

      await _dio.post(_('me'), data: data);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
