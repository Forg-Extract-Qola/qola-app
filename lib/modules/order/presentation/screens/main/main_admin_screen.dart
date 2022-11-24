import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/core/utils/menu.dart';
import 'package:qola_app/layouts/menu/menu_item.dart';
import 'package:qola_app/layouts/menu/menu_layout.dart';
import 'package:qola_app/modules/order/presentation/cubits/dish/dish_cubit.dart';
import 'package:qola_app/modules/order/presentation/cubits/order/order_cubit.dart';
import 'package:qola_app/modules/order/presentation/cubits/table/table_cubit.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/dish_page.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/home_page.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/order_page.dart';

class MainAdminScreen extends StatelessWidget {
  const MainAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>(
          create: (BuildContext context) => sl<OrderCubit>()..loadOrders(),
        ),
        BlocProvider<DishCubit>(
          create: (context) => sl<DishCubit>()..loadDishes()
        ),
        BlocProvider<TableCubit>(
            create: (context) => sl<TableCubit>()..loadAvailableTables()
        )
      ],
      child: MenuLayout(
        items: adminItemsList,
        pages: pages(),
        child: Container(),
      ),
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



