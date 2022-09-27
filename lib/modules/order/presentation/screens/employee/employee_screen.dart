import 'package:flutter/material.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_alignments.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_card.dart';
import 'package:qola_app/shared/qola_pages.dart';

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
      child: EmployeeContent(),
    );
  }
}

class EmployeeContent extends StatelessWidget {
  const EmployeeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        EmployeeAdd(),
        EmployeeList()
      ],
    );
  }
}

class EmployeeAdd extends StatelessWidget {
  const EmployeeAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LargeAccentButton(
      text: 'Nuevo colaborador',
      onPressed: () => Navigator.pushNamed(context, RoutesPath.employeeAddEditPath),
    );
  }
}


class EmployeeList extends StatelessWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 20.0),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return EmployeeCardElement(
          name: 'Jose',
          image: 'https://xsgames.co/randomusers/assets/avatars/male/${index+1}.jpg',
          code: 'U20200545',
        );
      }
    );
  }
}

class EmployeeCardElement extends StatelessWidget {

  final String name;
  final String image;
  final String? code;

  const EmployeeCardElement({
    Key? key,
    required this.name,
    required this.image,
    this.code
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageCard(
      image: image,
      title: name,
      description: 'ID: ${code ?? ''}',
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

