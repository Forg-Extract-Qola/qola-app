import 'package:flutter/material.dart';
import 'package:qola_app/layouts/menu/menu_item.dart';
import 'package:qola_app/layouts/menu/menu_layout.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/dish_page.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/home_page.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/order_page.dart';

class MainEmployeeScreen extends StatelessWidget {
  const MainEmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      pages: pages(),
      child: Container(),
    );
  }

  List<Item> pages() {
    return <Item>[
      Item(displayName: 'Home', icon: Icons.home, page: const HomePage()),
      Item(displayName: 'Order', icon: Icons.menu_book, page: const OrderPage()),
      Item(displayName: 'Dish', icon: Icons.restaurant_menu, page: const DishPage()),
    ];
  }
}
