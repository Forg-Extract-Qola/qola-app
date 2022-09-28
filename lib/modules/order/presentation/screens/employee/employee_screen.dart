import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qola_app/core/base/injection_container.dart';
import 'package:qola_app/core/bloc/bloc_state.dart';
import 'package:qola_app/modules/order/domain/dtos/employee_dto.dart';
import 'package:qola_app/modules/order/presentation/cubits/employee/employee_cubit.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/theme/colors.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlankWithTitlePage(
      title: 'Trabajadores',
      action: TextIconPrimaryButton(
          text: 'Nuevo',
          onPressed: () {},
          icon: Icons.add
      ),
      child: BlocProvider(
        create: (context) =>
        sl<EmployeeCubit>()
          ..loadEmployees(),
        child: const EmployeeContent(),
      ),
    );
  }
}

class EmployeeContent extends StatelessWidget {
  const EmployeeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          EmployeeAddButton(),
          EmployeeList()
        ],
      ),
    );
  }
}

class EmployeeAddButton extends StatelessWidget {
  const EmployeeAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeAccentButton(
      text: 'Nuevo colaborador',
      onPressed: () =>
          Navigator.pushNamed(context, RoutesPath.employeeAddEditPath),
    );
  }
}


class EmployeeList extends StatelessWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      builder: (context, state) {
        if (state.state == BlocState.loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: CircularProgressIndicator(color: primaryColor),
          );
        }

        final employees = state.employees;
        return ListView.builder(
            itemCount: employees.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return EmployeeCardElement(
                employee: employees[index],
                image: 'https://xsgames.co/randomusers/assets/avatars/male/${index + 1}.jpg',
              );
            }
        );
      },
    );
  }
}

class EmployeeCardElement extends StatelessWidget {

  final EmployeeDto employee;
  final String image;

  const EmployeeCardElement({
    Key? key,
    required this.employee,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageCard(
      image: image,
      title: employee.name ?? '',
      description: 'Cargo : ${employee.charge ?? ''}',
      action: VerticalAlignment(
        child: IconButton(
          icon: const Icon(Icons.edit_rounded, size: 20.0),
          onPressed: () {},
          color: Colors.black45,
          splashRadius: 25.0,
        ),
      ),
    );
  }
}

