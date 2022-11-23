import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/modules/order/domain/dtos/dish_dto.dart';
import 'package:qola_app/modules/order/presentation/bloc/dish/dish_bloc.dart';
import 'package:qola_app/shared/qola_pages.dart';

class DishInformationScreen extends StatelessWidget {

  final DishDto? dish;
  const DishInformationScreen({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dish = ModalRoute.of(context)?.settings.arguments as DishDto?;

    return CustomBlankWithTitlePage(
      title: dish?.name ?? '',
      child: BlocProvider<DishBloc>(
        create: (context) => sl<DishBloc>()..add(DishLoaded(dish)),
        child: DishInformationDetail(dish: dish),
      ),
    );
  }
}

class DishInformationDetail extends StatelessWidget {
  final DishDto? dish;
  const DishInformationDetail({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: BlocListener<DishBloc, DishState>(
          listener: resolveResponse,
          child: DishDashBoard(dish: dish),
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

class DishDashBoard extends StatelessWidget {
  final DishDto? dish;
  const DishDashBoard({Key? key, this.dish}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(dish?.image ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: Column (
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                        'Plato: ${dish?.name}',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                        'Precio: S/${dish?.price}',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ]
              )
            ],
          )
        ),
        Container(
          child: Column (
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Text(
                      'Descripción',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Text(
                    '${dish?.description}',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ]
          )
        )
      ],
    );
  }
}