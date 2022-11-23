import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/modules/order/domain/dtos/order_dto.dart';
import 'package:qola_app/modules/order/presentation/bloc/order/order_bloc.dart';
import 'package:qola_app/modules/order/presentation/screens/main/pages/order/order_dish_form.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';
import 'package:qola_app/theme/theme.dart';

class OrderDishDetail extends StatelessWidget {

  final OrderDto? order;

  const OrderDishDetail({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        //title: Text('Contact Us'),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      contentTextStyle: genericTextStyle(),
      content: BlocProvider(
        create: (context) => sl<OrderBloc>()..add(OrderLoaded(order)),
        child: const OrderAddEditForm()
      )
    );
  }
}

class OrderAddEditForm extends StatelessWidget {
  final OrderDto? order;

  const OrderAddEditForm({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: BlocListener<OrderBloc, OrderState>(
          listener: resolveResponse,
          child: OrderFormList(order: order),
        )
    );
  }

  void resolveResponse(BuildContext context, OrderState state) {
    if (state.status == FormzStatus.submissionSuccess) {
      Navigator.pop(context, true);
    }
    if (state.status == FormzStatus.submissionFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.error ?? ''),
      ));
    }
  }
}

class OrderFormList extends StatelessWidget {
  final OrderDto? order;

  const OrderFormList({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = order == null ? 'Nueva orden' : 'Actualiza la orden';

    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
            children: [
              CustomText(title, color: primaryColor, size: 20.0),
              const SizedBox(height: 40.0),
              if (state.editable) const OrderNoteField(),
              const OrderDishesElements(),
              const OrderSubmitButton()
            ]
        );
      },
    );
  }
}
