import 'package:flutter/material.dart';
import 'package:qola_app/routes.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_pages.dart';
import 'package:qola_app/shared/qola_texts.dart';

class HomeAuthScreen extends StatelessWidget {
  const HomeAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageWithBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextTitle('QOLA'),
          const TextParagraph('La plataforma donde poder facilitar la administración de tu restaurante es nuestro trabajo'),
          LargeLightButton(
            text: 'SOY ADMINISTRADOR',
            onPressed: () => Navigator.pushNamed(context, RoutesPath.signInAdminPath),
          ),
          LargeAccentButton(
            text: 'SOY TRABAJADOR',
            onPressed: () => Navigator.pushNamed(context, RoutesPath.signInEmployeePath),
          )
        ],
      ),
    );
  }
}