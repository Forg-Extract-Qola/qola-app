import 'package:flutter/material.dart';

class MenuLayout extends StatelessWidget {

  final Widget child;

  const MenuLayout({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
