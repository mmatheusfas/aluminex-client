import 'package:aluminex_client/features/bottom_navigation.dart/bottom_navigation_view.dart';
import 'package:aluminex_client/features/orders/orders_view.dart';
import 'package:aluminex_client/features/web_view/web_view_page.dart';
import 'package:aluminex_client/services/service_locator.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:flutter/material.dart';

import 'features/login/login_view.dart';
import 'features/splash/splash_view.dart';

void main() {
  setupServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AluminexCoreConfig(
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashView(),
        '/login': (_) => const LoginView(),
        '/home': (_) => const BottomNavigationView(),
        '/web-view': (_) => const WebViewPage(),
        '/order': (_) => const OrdersView(),
      },
    );
  }
}
