import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/modules/order/domain/dtos/table_dto.dart';
import 'package:qola_app/modules/order/presentation/cubits/table/table_cubit.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/theme/colors.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlankWithTitlePage(
        title: 'Mesas',
        child: BlocProvider(
          create: (context) =>
          sl<TableCubit>()
            ..loadTables(),
          child: const TableContent(),
        )
    );
  }
}

class TableContent extends StatelessWidget {
  const TableContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          TableAddButton(),
          TableList()
        ],
      ),
    );
  }
}

class TableAddButton extends StatelessWidget {
  const TableAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableCubit, TableState>(
      builder: (context, state) {
        return LargeAccentButton(
          text: 'Nueva mesa',
          onPressed: () => context.read<TableCubit>().openAddEditTable(context),
        );
      },
    );
  }
}


class TableList extends StatelessWidget {
  const TableList({Key? key}) : super(key: key);

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
      action: VerticalAlignment(
        child: IconButton(
          icon: const Icon(Icons.edit_rounded, size: 20.0),
          onPressed: () => context.read<TableCubit>().openAddEditTable(context, table: table),
          color: Colors.black45,
          splashRadius: 25.0,
        ),
      ),
    );
  }
}

