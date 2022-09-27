
import 'package:flutter/material.dart';
import 'package:qola_app/modules/auth/presentation/screens/admin/sign_in_admin_screen.dart';
import 'package:qola_app/modules/auth/presentation/screens/home_auth_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/employee/employee_add_edit_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/employee/employee_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/main/main_admin_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/main/main_employee_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case RoutesPath.homeAuthPath: return MaterialPageRoute(builder: (_) => const HomeAuthScreen());
      case RoutesPath.signInAdminPath: return MaterialPageRoute(builder: (_) => const SignInAdminScreen());
      case RoutesPath.mainAdminPath: return MaterialPageRoute(builder: (_) => const MainAdminScreen());
      case RoutesPath.mainEmployeePath: return MaterialPageRoute(builder: (_) => const MainEmployeeScreen());
      case RoutesPath.employeeListPath: return MaterialPageRoute(builder: (_) => const EmployeeScreen());
      case RoutesPath.employeeAddEditPath: return MaterialPageRoute(builder: (_) => const EmployeeAddEditScreen());
      default: return MaterialPageRoute(builder: (_) => const HomeAuthScreen());
    }
  }
}

class RoutesPath {
  static const String homeAuthPath = '/home-screen';
  static const String signInAdminPath = '/sign-in-admin-screen';
  static const String signInEmployeePath = '/sign-in-employee-screen';
  static const String mainAdminPath = '/main-admin-screen';
  static const String mainEmployeePath = '/main-employee-screen';
  static const String employeeListPath = '/employee-list-screen';
  static const String employeeAddEditPath = '/employee-add-edit-screen';
}