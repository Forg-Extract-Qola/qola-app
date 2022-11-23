import 'package:flutter/material.dart';
import 'package:qola_app/layouts/menu/menu_item.dart';
import 'package:qola_app/routes.dart';

final adminItemsList = <Item>[
  Item(displayName: 'Colaboradores', icon: Icons.person_outline, route: RoutesPath.employeeListPath),
  Item(displayName: 'Platos', icon: Icons.restaurant, route: RoutesPath.dishListPath),
  Item(displayName: 'Mesas', icon: Icons.table_bar_sharp, route: RoutesPath.tablesListPath),
];