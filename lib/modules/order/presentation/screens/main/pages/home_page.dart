import 'package:flutter/material.dart';
import 'package:qola_app/shared/qola_texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText('HOME PAGE', color: Colors.black87,),
    );
  }
}
