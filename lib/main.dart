import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:seller/data/notification/background_fcm.dart';
import 'package:seller/data/notification/notification_service.dart';
import 'package:seller/data/providers/firebase_provider.dart';
import 'package:seller/ui/common/theme.dart';
import 'package:seller/ui/pages/auth/login_page.dart';
import 'package:seller/ui/pages/edit_page.dart';
import 'package:seller/ui/pages/home_page.dart';
import 'package:seller/ui/widgets/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID');

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    NotificationService().initializeNotificationHandler(context);
  }

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
        HomePage.route: (_) => AuthWrapper(
              auth: (_) => HomePage(),
              guest: () => LoginPage(),
              showLoading: true,
            ),
        EditPage.route: (_) => AuthWrapper(
              auth: (_) => EditPage(),
              guest: () => LoginPage(),
              showLoading: true,
            ),
      },
    );
  }
}
