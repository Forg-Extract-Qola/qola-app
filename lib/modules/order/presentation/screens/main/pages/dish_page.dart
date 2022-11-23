import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/presentation/cubits/dish/dish_cubit.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/theme/colors.dart';

 class DishPage extends StatelessWidget {
  const DishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomMainPage(
        child: DishContent()
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
          DishList()
        ],
      ),
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
      fit: BoxFit.cover,
      action: VerticalAlignment(
        child: IconButton(
          icon: const Icon(Icons.expand_more, size: 20.0),
          onPressed: () => context.read<DishCubit>().openInformationDish(context, dish: dish),
          color: Colors.black45,
          splashRadius: 25.0,
        ),
      ),
    );
  }
}
