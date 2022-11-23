import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/presentation/cubits/dish/dish_cubit.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/theme/colors.dart';


class DishScreen extends StatelessWidget {
  const DishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlankWithTitlePage(
        title: 'Platos',
        //action: TextIconPrimaryButton(
        //    text: 'Nuevo',
        //    onPressed: () {},
        //    icon: Icons.add
        //),
        child: BlocProvider(
          create: (context) =>
          sl<DishCubit>()
            ..loadDishes(),
          child: const DishContent(),
        )
    );
  }
}

class DishContent extends StatelessWidget {
  const DishContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          DishAddButton(),
          DishList()
        ],
      ),
    );
  }
}

class DishAddButton extends StatelessWidget {
  const DishAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishCubit, DishState>(
      builder: (context, state) {
        return LargeAccentButton(
          text: 'Nuevo plato',
          onPressed: () => context.read<DishCubit>().openAddEditDish(context),
        );
      },
    );
  }
}

class DishList extends StatelessWidget {
  const DishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishCubit, DishState>(
      builder: (context, state) {
        if (state.state == BlocState.loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: CircularProgressIndicator(color: primaryColor),
          );
        }

        final dishes = state.categories;
        return ListView.builder(
            itemCount: dishes.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return DishCardElement(
                dish: dishes[index],
              );
            }
        );
      },
    );
  }
}

class DishCardElement extends StatelessWidget {

  final DishDto dish;

  const DishCardElement({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageCard(
      image: dish.image ?? '',
      title: dish.name ?? '',
      description: dish.categoryDish ?? '',
      action: VerticalAlignment(
        child: IconButton(
          icon: const Icon(Icons.edit_rounded, size: 20.0),
          onPressed: () => context.read<DishCubit>().openAddEditDish(context, dish: dish),
          color: Colors.black45,
          splashRadius: 25.0,
        ),
      ),
    );
  }
}