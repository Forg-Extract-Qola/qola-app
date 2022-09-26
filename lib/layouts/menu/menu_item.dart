import 'package:flutter/material.dart';

class Item {
  String displayName;
  IconData? icon;
  String? route;
  Function()? onPressed;
  Widget? page;

  Item({
    required this.displayName,
    this.icon,
    this.route,
    this.onPressed,
    this.page
  });
}

