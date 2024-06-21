import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/app/navigator/navigator.dart';
import 'package:vendor_vault/features/auth/presentation/navigator/register_navigator.dart';
import 'package:vendor_vault/features/auth/presentation/view/login_screen.dart';

final loginScreenNavigatorProvider = Provider((ref) => LoginScreenNavigator());

class LoginScreenNavigator with RegistrationScreenRoute {
  void openHomeScreen() {}
}

mixin LoginScreenRoute {
  openLoginScreen() {
    NavigateRoute.popAndPushRoute(const LoginScreen());
  }
}
