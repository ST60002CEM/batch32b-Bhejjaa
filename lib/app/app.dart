import 'package:flutter/material.dart';
import 'package:vendor_vault/features/splash/presentation/view/splash_view.dart';
import 'package:vendor_vault/screens/dashboard_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
