import 'package:diiket_models/all.dart';
import 'package:seller/data/providers/auth/auth_provider.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthWrapper extends HookWidget {
  final Widget Function(User)? auth;
  final Widget Function()? guest;

  final bool isAnimated;
  final bool showLoading;

  AuthWrapper({
    this.auth,
    this.guest,
    this.isAnimated = true,
    this.showLoading = false,
  });

  Widget build(BuildContext context) {
    final User? user = useProvider(authProvider);
    final bool isLoading = useProvider(authLoadingProvider).state;

    if (showLoading && isLoading)
      return Container(
        alignment: Alignment.center,
        color: ColorPallete.backgroundColor,
        child: CircularProgressIndicator(),
      );

    Widget child = user == null
        ? (guest?.call() ?? SizedBox.shrink())
        : (auth?.call(user) ?? SizedBox.shrink());

    if (!isAnimated) {
      return child;
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: child,
    );
  }
}
