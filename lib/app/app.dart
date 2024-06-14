import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/app/navigator_key/navigator_key.dart';
import 'package:vendor_vault/features/splash/presentation/view/splash_view.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'VendorVault',
      home: const SplashScreen(),
    );
  }
}
