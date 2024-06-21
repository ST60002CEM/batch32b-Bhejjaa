import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/app/navigator/navigator.dart';
import 'package:vendor_vault/features/auth/presentation/view/login_screen.dart';

final homeScreenNavigatorProvider = Provider((ref) => HomeScreenNavigator());

class HomeScreenNavigator with HomeScreenRoute{}

mixin HomeScreenRoute{
  openHomeScreen(){
    NavigateRoute.popAndPushRoute(const LoginScreen());
  }
}
