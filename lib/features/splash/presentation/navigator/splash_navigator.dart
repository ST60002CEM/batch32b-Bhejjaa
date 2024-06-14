
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/features/auth/presentation/navigator/login_navigator.dart';

final splashViewNavigatorProvider =
Provider<SplashViewNavigator>((ref) => SplashViewNavigator());

// This class will be used to navigate to LoginView
class SplashViewNavigator with LoginScreenRoute {}

mixin SplashViewRoute {}