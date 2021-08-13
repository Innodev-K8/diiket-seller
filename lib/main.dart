import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/notification/background_fcm.dart';
import 'package:seller/data/providers/firebase_provider.dart';
import 'package:seller/ui/common/theme.dart';
import 'package:seller/ui/pages/edit_page.dart';
import 'package:seller/ui/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diiket Seller',
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      initialRoute: HomePage.route,
      navigatorObservers: [
        FirebaseAnalyticsObserver(
          analytics: context.read(analyticsProvider),
        ),
      ],
      routes: {
        HomePage.route: (_) => HomePage(),
        EditPage.route: (_) => EditPage(),
      },
    );
  }
}
