import 'package:flutter/material.dart';

class HorizontalAlignment extends StatelessWidget {
  const HorizontalAlignment({
    Key? key,
    required this.child,
    this.alignment = MainAxisAlignment.center
  }) : super(key: key);

  final Widget child;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: alignment,children: [child]);
}

class VerticalAlignment extends StatelessWidget {
  const VerticalAlignment({
    Key? key,
    required this.child,
    this.alignment = MainAxisAlignment.center,
    this.cross = CrossAxisAlignment.center
  }) : super(key: key);

  final Widget child;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment cross;

  @override
  Widget build(BuildContext context) =>
      Column(
          mainAxisAlignment: alignment,
          crossAxisAlignment: cross,
          children: [child]);
}