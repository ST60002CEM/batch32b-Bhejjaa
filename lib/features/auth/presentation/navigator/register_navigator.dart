
import 'package:vendor_vault/app/navigator/navigator.dart';
import 'package:vendor_vault/screens/registration_screen.dart';

class RegistrationScreenNavigator {}

mixin RegistrationScreenRoute {
  openRegistrationScreen() {
    NavigateRoute.pushRoute(const RegistrationScreen());
  }
}
