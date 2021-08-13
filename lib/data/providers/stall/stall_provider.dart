import 'package:diiket_models/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/network/stall_service.dart';
import 'package:seller/data/providers/auth/auth_provider.dart';
import 'package:seller/data/providers/firebase_provider.dart';

final stallProvider = StateNotifierProvider<StallState, Stall?>(
  (ref) {
    return StallState(ref.read);
  },
);

class StallState extends StateNotifier<Stall?> {
  final Reader _read;

  StallState(this._read) : super(null) {
    _read(authProvider.notifier).addListener((user) {
      state = user?.stall;
    });
  }

  Future<void> setStallOpenStatus(bool isOpen) async {
    if (state != null) {
      return updateStall(state!.copyWith(
        is_open: isOpen,
      ));
    }
  }

  Future<void> updateStall(Stall stall) async {
    try {
      state = await _read(stallServiceProvider).updateStall(stall);

      if (state != null) {
        _read(authProvider.notifier).updateUserStall(state!);
      }
    } catch (exception, stack) {
      _read(crashlyticsProvider).recordError(exception, stack);

      rethrow;
    }
  }
}
