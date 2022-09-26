import 'package:flutter/material.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/layouts/menu/cubits/menu_bar_cubit.dart';
import 'package:qola_app/layouts/menu/menu_item.dart';
import 'package:qola_app/layouts/menu/menu_section.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class MenuLayout extends StatelessWidget {

  final Widget child;
  final List<Item> items;
  final List<Item> pages;

  const MenuLayout({
    Key? key,
    required this.child,
    this.items = const [],
    this.pages = const []
  }) : super(key: key);

  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static GlobalKey<CurvedNavigationBarState> navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MenuBarCubit>(),
      child: BlocBuilder<MenuBarCubit, int>(
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            drawer: items.isNotEmpty ? MenuSection(items: items) : null,
            appBar: AppBar(
              foregroundColor: primaryColor,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
              leading: items.isNotEmpty ?  IconButton(
                icon: const Icon(Icons.menu, size: 35.0,),
                splashRadius: 25.0,
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ) : null,
              title: const TextBold('Qola', color: Colors.black87, size: 30.0),
            ),
            body: pages.isEmpty ? child : pages[state].page,
            bottomNavigationBar: pages.isEmpty ? null : CurvedNavigationBar(
              key: navigationKey,
              color: primaryColor,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: primaryColor,
              height: 60.0,
              animationCurve: Curves.easeOut,
              animationDuration: const Duration(milliseconds: 400),
              index: state,
              items: pages.map((e) => Icon(e.icon, size: 30.0, color: Colors.white,)).toList(),
              onTap: (index) => BlocProvider.of<MenuBarCubit>(context).changePage(index),
            ),
          );
        },
      ),
    );
  }
}
