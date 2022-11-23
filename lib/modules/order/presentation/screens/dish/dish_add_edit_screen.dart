import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/presentation/bloc/dish/dish_bloc.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

import '../../../../../core/base/injection_container.dart';
import 'dish_add_edit_form.dart';

class DishAddEditScreen extends StatelessWidget {
  const DishAddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dish = ModalRoute.of(context)?.settings.arguments as DishDto?;

    return CustomBlankWithTitlePage(
      title: 'Platos',
      child: BlocProvider<DishBloc>(
        create: (context) => sl<DishBloc>()..add(DishLoaded(dish)),
        child: DishAddEditForm(dish: dish),
      ),
    );
  }
}

class DishAddEditForm extends StatelessWidget {
  final DishDto? dish;
  const DishAddEditForm({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: BlocListener<DishBloc, DishState>(
          listener: resolveResponse,
          child: DishFormList(dish: dish),
        )
    );
  }

  void resolveResponse(BuildContext context, DishState state) {
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

class DishFormList extends StatelessWidget {
  final DishDto? dish;
  const DishFormList({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final title = dish == null ? 'Registro de un nuevo plato' : 'Actualización del plato';

    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomText(title, color: primaryColor, size: 20.0),
            const SizedBox(height: 40.0),
            if (state.editable) const DishNameField(),
            if (state.editable) const DishDescriptionField(),
            if (state.editable) const DishImageField(),
            if (state.editable) const DishCategoryField(),
            if (state.editable) const DishPriceField(),
            const DishSubmitButton()
          ]
        );
      },
    );
  }
}