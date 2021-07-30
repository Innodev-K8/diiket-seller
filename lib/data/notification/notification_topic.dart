import 'package:diiket_models/all.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> subscribeToMarketSellerNotificationTopic(User? seller) async {
  final int? marketId = seller?.stall?.market_id;

  if (marketId == null) return;

  print('Subscribing to ' + 'market-$marketId.seller');

  return FirebaseMessaging.instance.subscribeToTopic('market-$marketId.seller');
}

Future<void> unSubscribeToMarketSellerNotificationTopic(User? seller) async {
  final int? marketId = seller?.stall?.market_id;

  if (marketId == null) return;

  print('Unubscribing to ' + 'market-$marketId.seller');

  return FirebaseMessaging.instance
      .unsubscribeFromTopic('market-$marketId.seller');
}
