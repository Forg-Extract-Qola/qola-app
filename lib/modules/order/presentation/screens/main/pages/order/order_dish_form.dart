import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/core/utils/messages.dart';
import 'package:qola_app/modules/order/presentation/bloc/order/order_bloc.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_images.dart';
import 'package:qola_app/shared/qola_text_field.dart';
import 'package:qola_app/theme/colors.dart';
import 'package:qola_app/theme/theme.dart';

class OrderNoteField extends StatelessWidget {
  const OrderNoteField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (prev, next) => prev.notes != next.notes,
      builder: (context, state) {
        return GenericFormField(
          value: state.notes.value,
          hintText: 'Nota',
          onChanged: (note) => context.read<OrderBloc>().add(OrderNoteEventChanged(note)),
          validationText: !state.notes.pure && state.notes.error == FieldRequiredValidationError.empty ? fieldRequiredFormat : null
        );
      }
    );
  }
}

class OrderSubmitButton extends StatelessWidget {
  const OrderSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return LargeSolidButton(
          text: state.order == null ? 'CREAR ORDEN' : 'MODIFICAR ORDEN',
          onPressed: state.status == FormzStatus.valid ||
              state.status == FormzStatus.submissionFailure ?
              () => context.read<OrderBloc>().add(const OrderSubmitted()) : null,
          child: state.status == FormzStatus.submissionInProgress
              ? const CircularProgressIndicator(color: Colors.white)
              : null,
        );
      },
    );
  }
}

class OrderDishesElements extends StatelessWidget {
  const OrderDishesElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.dishes.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: primaryColor));
        }
        final dishes = state.dishes;
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            final dish = dishes[index];
            final selected = state.dishesSelected.contains(dish.id!);
            return CheckboxListTile(
              title: Text(dish.name!, style: genericTextStyle(color: Colors.black)),
              value: selected,
              dense: false,
              onChanged: (_) => context.read<OrderBloc>().add(OrderAddOrRemoveDishEventChanged(dish.id!)),
              secondary: CustomImage(url: dish.image!, width: 60.0,),
            );
          }
        );
      },
    );
  }
}
