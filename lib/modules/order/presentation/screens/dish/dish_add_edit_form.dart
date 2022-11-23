import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/field/field_required.dart';
import 'package:qola_app/core/utils/messages.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/presentation/bloc/dish/dish_bloc.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_text_field.dart';

class DishNameReadOnly extends StatelessWidget {

  final DishDto? dish;

  const DishNameReadOnly({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericFormField(
      value: dish?.name,
      hintText: 'Nombre',
      readOnly: true
    );
  }
}

class DishNameField extends StatelessWidget {
  const DishNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
        buildWhen: (prev, next) => prev.name != next.name,
        builder: (context, state) {
          return GenericFormField(
              value: state.name.value,
              hintText: 'Nombre',
              onChanged: (name) =>
                  context.read<DishBloc>().add(DishNameChanged(name)),
              validationText: !state.name.pure &&
                  state.name.error == FieldRequiredValidationError.empty
                  ? fieldRequiredFormat
                  : null
          );
        }
    );
  }
}

class DishDescriptionReadOnly extends StatelessWidget {
  final DishDto? dish;
  const DishDescriptionReadOnly({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericFormField(
      value: dish?.description,
      hintText: 'Description',
      readOnly: true
    );
  }
}

class DishDescriptionField extends StatelessWidget {
  const DishDescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
        buildWhen: (prev, next) => prev.description != next.description,
        builder: (context, state) {
          return GenericFormField(
              value: state.description.value,
              hintText: 'Description',
              onChanged: (description) =>
                  context.read<DishBloc>().add(DishDescriptionChanged(description)),
              validationText: !state.description.pure &&
                  state.description.error == FieldRequiredValidationError.empty
                  ? fieldRequiredFormat
                  : null
          );
        }
    );
  }
}

class DishImageReadOnly extends StatelessWidget {
  final DishDto? dish;
  const DishImageReadOnly({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericFormField(
      value: dish?.image,
      hintText: 'URL Image',
      readOnly: true
    );
  }
}

class DishImageField extends StatelessWidget {
  const DishImageField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
        buildWhen: (prev, next) => prev.image != next.image,
        builder: (context, state) {
          return GenericFormField(
              value: state.image.value,
              hintText: 'URL Image',
              onChanged: (image) =>
                  context.read<DishBloc>().add(DishImageChanged(image)),
              validationText: !state.image.pure &&
                  state.image.error == FieldRequiredValidationError.empty
                  ? fieldRequiredFormat
                  : null
          );
        }
    );
  }
}

class DishCategoryReadOnly extends StatelessWidget {
  final DishDto? dish;
  const DishCategoryReadOnly({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericFormField(
      value: dish?.categoryDish,
      hintText: 'Category',
      readOnly: true
    );
  }
}

class DishCategoryField extends StatelessWidget {
  const DishCategoryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
        buildWhen: (prev, next) => prev.categoryDish != next.categoryDish,
        builder: (context, state) {
          return GenericFormField(
              value: state.categoryDish.value,
              hintText: 'Category',
              onChanged: (categoryDish) =>
                  context.read<DishBloc>().add(DishCategoryDishChanged(categoryDish)),
              validationText: !state.categoryDish.pure &&
                  state.categoryDish.error == FieldRequiredValidationError.empty
                  ? fieldRequiredFormat
                  : null
          );
        }
    );
  }
}

class DishPriceReadOnly extends StatelessWidget {
  final DishDto? dish;
  const DishPriceReadOnly({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericFormField(
      valueNumber: dish?.price,
      hintText: 'Price',
      readOnly: true
    );
  }
}

class DishPriceField extends StatelessWidget {
  const DishPriceField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
        buildWhen: (prev, next) => prev.price != next.price,
        builder: (context, state) {
          return GenericFormField(
              valueNumber: state.price.value,
              hintText: 'Price',
              onChanged: (price) =>
                  context.read<DishBloc>().add(DishPriceChanged(price)),
              validationText: !state.price.pure &&
                  state.price.error == FieldRequiredValidationError.empty
                  ? fieldRequiredFormat
                  : null
          );
        }
    );
  }
}

class DishEnableEditButton extends StatelessWidget {
  const DishEnableEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        return LargeSolidButton(
          text: 'Editar',
          onPressed: () => context.read<DishBloc>().add(const DishEnableEdit())
        );
      },
    );
  }
}

class DishSubmitButton extends StatelessWidget {
  const DishSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        return LargeSolidButton(
          text: state.dish == null ? 'REGISTRAR' : 'MODIFICAR',
          onPressed: state.status == FormzStatus.valid ||
              state.status == FormzStatus.submissionFailure ?
          () => context.read<DishBloc>().add(const DishSubmitted()) : null,
          child: state.status == FormzStatus.submissionInProgress
              ? const CircularProgressIndicator(color: Colors.white)
              : null,
        );
      },
    );
  }
}
