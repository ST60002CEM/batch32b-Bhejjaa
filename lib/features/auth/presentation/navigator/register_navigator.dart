import 'package:vendor_vault/app/navigator/navigator.dart';
import 'package:vendor_vault/features/auth/presentation/view/registration_screen.dart';

class RegistrationScreenNavigator {}

mixin RegistrationScreenRoute {
  openRegistrationScreen() {
    NavigateRoute.pushRoute(const RegistrationScreen());
  }
}
