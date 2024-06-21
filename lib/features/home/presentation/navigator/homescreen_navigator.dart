import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/app/navigator/navigator.dart';
import 'package:vendor_vault/features/auth/presentation/navigator/login_navigator.dart';
import 'package:vendor_vault/features/home/presentation/view/home_screen.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeViewNavigator());

class HomeViewNavigator with LoginScreenRoute {
  void openHomeView() {}
}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.popAndPushRoute(HomeScreen());
  }
}