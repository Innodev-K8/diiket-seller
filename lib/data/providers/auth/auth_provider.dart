import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diiket_models/all.dart';
import 'package:seller/data/network/auth_service.dart';
import 'package:seller/data/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seller/data/repositories/firebase_auth_repository.dart';

import 'token_provider.dart';

final authLoadingProvider = StateProvider<bool>((_) => true);

final authProvider = StateNotifierProvider<AuthState, User?>((ref) {
  return AuthState(
    ref.read(authServiceProvider),
    ref.read(firebaseAuthRepositoryProvider),
    ref.read,
  );
});

final authExceptionProvider = StateProvider<CustomException?>((_) => null);

class AuthState extends StateNotifier<User?> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final AuthService _authService;
  final Reader _read;

  AuthState(
    this._authService,
    this._firebaseAuthRepository,
    this._read,
  ) : super(null) {
    this.refreshProfile();
  }

  void updateUserStall(Stall stall) {
    state = state?.copyWith(
      stall: stall,
    );
  }

   Future<void> signInWithPhoneCredential(
      firebase_auth.PhoneAuthCredential credential) async {
    try {
      if (_firebaseAuthRepository.getCurrentFirebaseUser() != null) {
        await signOut();
      }

      // try to login using firebase
      await _firebaseAuthRepository.signInWithPhoneCredential(credential);

      // login to laravel using the firebase user
      final loggedUser = _firebaseAuthRepository.getCurrentFirebaseUser();

      if (loggedUser != null) {
        return await _signInWithFirebaseUser(loggedUser);
      }
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  // Komunikasi ke laravel
  Future<void> updateUserName(String name) async {
    try {
      await _authService.updateProfile({
        'name': name,
      });

      await refreshProfile();
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  Future<void> updateDeviceToken(String token) async {
    try {
      await _authService.updateProfile({
        'fcm_token': token,
      });

      await refreshProfile();
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  Future<void> refreshProfile() async {
    try {
      state = await _authService.me();
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    } finally {
      _read(authLoadingProvider).state = false;
    }
  }

  Future<void> _signInWithFirebaseUser(firebase_auth.User user) async {
    try {
      final String firebaseToken = await user.getIdToken();
      final String? fcmToken = await _read(messagingProvider).getToken();

      final AuthResponse response =
          await _authService.loginWithFirebaseToken(firebaseToken, fcmToken);

      if (response.token != null && response.user != null) {
        await _read(tokenProvider.notifier).setToken(response.token!);
        await _read(crashlyticsProvider)
            .setUserIdentifier('${response.user!.id}#${response.user!.name}');

        state = response.user;
      } else {
        await signOut();
      }
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    } finally {
      _read(authLoadingProvider).state = false;
    }
  }

  Future<void> signOut() async {
    try {
      _read(authLoadingProvider).state = true;
      
      await _firebaseAuthRepository.signOut();
      await _authService.logout().onError((error, stackTrace) => null);
      await _read(tokenProvider.notifier).clearToken();

      state = null;

      _read(authLoadingProvider).state = false;
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }
}
