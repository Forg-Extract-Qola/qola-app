import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/presentation/cubits/table/table_cubit.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/theme/colors.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Mesas disponibles',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
        child: BlocProvider(
        create: (context) =>
    sl<TableCubit>()
    ..loadAvailableTables(),
    child: const HomeContent(),
    )
    ),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          TableAvailableList()
        ],
      ),
    );
  }
}

class TableAvailableList extends StatelessWidget{
  const TableAvailableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableCubit, TableState>(
      builder: (context, state) {
        if (state.state == BlocState.loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: CircularProgressIndicator(color: primaryColor),
          );
        }

        final tables = state.tables;
        return ListView.builder(
            itemCount: tables.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return TableCardElement(
                table: tables[index],
              );
            }
        );
      },
    );
  }
}

class TableCardElement extends StatelessWidget {

  final TableDto table;

  const TableCardElement({
    Key? key,
    required this.table,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageCard(
      image: 'assets/images/icons/table.png',
      title: table.name ?? '',
      description: table.isOccupied == true ? 'OCUPADO' : 'LIBRE',
      /*
      * action: VerticalAlignment(
        child: IconButton(
          icon: const Icon(Icons.edit_rounded, size: 20.0),
          onPressed: () => context.read<TableCubit>().openAddEditTable(context, table: table),
          color: Colors.black45,
          splashRadius: 25.0,
        ),
      ),*/

    );
  }
}