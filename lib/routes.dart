
import 'package:flutter/material.dart';
import 'package:qola_app/modules/auth/presentation/screens/admin/sign_in_admin_screen.dart';
import 'package:qola_app/modules/auth/presentation/screens/home_auth_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/dish/dish_add_edit_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/dish/dish_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/employee/employee_add_edit_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/employee/employee_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/main/main_admin_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/main/main_employee_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/tables/table_add_edit_screen.dart';
import 'package:qola_app/modules/order/presentation/screens/tables/table_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case RoutesPath.homeAuthPath: return MaterialPageRoute(builder: (_) => const HomeAuthScreen());
      case RoutesPath.signInAdminPath: return MaterialPageRoute(builder: (_) => const SignInAdminScreen());
      case RoutesPath.mainAdminPath: return MaterialPageRoute(builder: (_) => const MainAdminScreen());
      case RoutesPath.mainEmployeePath: return MaterialPageRoute(builder: (_) => const MainEmployeeScreen());
      case RoutesPath.employeeListPath: return MaterialPageRoute(builder: (_) => const EmployeeScreen());
      case RoutesPath.employeeAddEditPath: return MaterialPageRoute(builder: (_) => const EmployeeAddEditScreen(), settings: settings);
      case RoutesPath.tablesListPath: return MaterialPageRoute(builder: (_) => const TableScreen());
      case RoutesPath.tableAddEditPath: return MaterialPageRoute(builder: (_) => const TableAddEditScreen(), settings: settings);
      case RoutesPath.dishListPath: return MaterialPageRoute(builder: (_) => const DishScreen());
      case RoutesPath.dishAddEditPath: return MaterialPageRoute(builder: (_) => const DishAddEditScreen(), settings: settings);
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
  static const String tablesListPath = '/table-list-screen';
  static const String tableAddEditPath = '/table-add-edit-screen';
  static const String dishListPath = '/dish-list-screen';
  static const String dishAddEditPath = '/dish-add-edit-screen';
}