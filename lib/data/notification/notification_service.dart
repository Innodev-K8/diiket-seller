import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/providers/order/active_orders_provider.dart';

class NotificationService {
  static NotificationService? _notificationService;

  factory NotificationService() {
    return _notificationService ?? NotificationService._();
  }

  NotificationService._();

  Future<StreamSubscription<RemoteMessage>> initializeNotificationHandler(
    BuildContext context,
  ) async {
    // get initial messages
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // handle initial message
      await _handleRemoteMessageData(context, initialMessage);
    }

    // handle forground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      // if we are in forground, just refresh the order
      if (message != null) {
        _handleRemoteMessageData(context, message);
      }
    });

    // handle on notification open
    return FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleRemoteMessageData(context, message));
  }

  Future<void> _handleRemoteMessageData(
    BuildContext context,
    RemoteMessage message,
  ) async {
    if (message.data['type'] == 'seller/new-order' ||
        message.data['type'] == 'seller/order-cancelled') {
      // if the message is a new/cancelled order, refresh the list of orders
      await context.read(activeOrdersProvider.notifier).fetchActiveOrders();
    }
  }
}
