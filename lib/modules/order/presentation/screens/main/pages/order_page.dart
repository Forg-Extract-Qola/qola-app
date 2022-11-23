import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/presentation/cubits/order/order_cubit.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/theme/colors.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomMainPage(
      child: OrderContent(),
    );
  }
}

class OrderContent extends StatelessWidget {
  const OrderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          OrderAddButton(),
          OrderList()
        ],
      ),
    );
  }
}

class OrderAddButton extends StatelessWidget {
  const OrderAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return LargeAccentButton(
          text: 'Nueva orden',
          onPressed: () => context.read<OrderCubit>().openCreateOrder(context),
        );
      },
    );
  }
}


class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.state == BlocState.loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: CircularProgressIndicator(color: primaryColor),
          );
        }

        final orders = state.orders;
        return ListView.builder(
            itemCount: orders.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderCardElement(
                order: orders[index],
              );
            }
        );
      },
    );
  }
}

class OrderCardElement extends StatelessWidget {

  final OrderDto order;

  const OrderCardElement({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageCard(
      image: 'assets/images/icons/bell.png',
      title: 'Orden N° ${order.id}',
      description: 'Atiende: ${order.employee?.name}',
      action: VerticalAlignment(
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 20.0),
          onPressed: () {},
          color: Colors.black45,
          splashRadius: 25.0,
        ),
      ),
    );
  }
}