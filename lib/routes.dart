
import 'package:flutter/material.dart';
import 'package:qola_app/modules/auth/presentation/screens/admin/sign_in_admin_screen.dart';
import 'package:qola_app/modules/auth/presentation/screens/home_auth_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case RoutesPath.homeAuthPath: return MaterialPageRoute(builder: (_) => const HomeAuthScreen());
      case RoutesPath.signInAdminPath: return MaterialPageRoute(builder: (_) => const SignInAdminScreen());
      default: return MaterialPageRoute(builder: (_) => const HomeAuthScreen());
    }
  }
}

class RoutesPath {
  static const String homeAuthPath = '/home-screen';
  static const String signInAdminPath = '/sign-in-admin-screen';
  static const String signInEmployeePath = '/sign-in-employee-screen';
}