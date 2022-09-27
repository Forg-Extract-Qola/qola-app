import 'package:flutter/material.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class HomeAuthScreen extends StatelessWidget {
  const HomeAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageWithBackground(
      background: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextTitle('QOLA'),
          const TextParagraph('La plataforma donde poder facilitar la administración de tu restaurante es nuestro trabajo'),
          LargeAccentButton(
            text: 'SOY ADMINISTRADOR',
            onPressed: () => Navigator.pushNamed(context, RoutesPath.signInAdminPath),
          ),
          LargeLightOutlinedButton(
            text: 'SOY TRABAJADOR',
            onPressed: () {},
            //onPressed: () => Navigator.pushNamed(context, RoutesPath.signInEmployeePath),
          )
        ],
      ),
    );
  }
}