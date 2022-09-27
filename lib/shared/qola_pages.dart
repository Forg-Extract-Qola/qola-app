import 'package:flutter/material.dart';
import 'package:qola_app/core/utils/size_config.dart';
import 'package:qola_app/shared/qola_buttons.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class CustomPageWithBackground extends StatelessWidget {

  final Widget child;

  const CustomPageWithBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: SizeConfig.screenHeight!/2.732,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgrounds/bg.png'),
                fit: BoxFit.fill
              )
            ),
          ),
          child
        ],
      ),
    );
  }
}

class CustomAuthPage extends StatelessWidget {

  final Widget child;
  final EdgeInsetsGeometry padding;

  const CustomAuthPage({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.only(top: 20)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight!/2.732,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/backgrounds/background_image.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: SizeConfig.screenWidth!/2.74,
                      height: SizeConfig.screenHeight!/7.762,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/backgrounds/logo.png')
                            )
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight!/68.3),
                      child: const TextTitle("Bienvenido!"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: padding,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}

class CustomBlankPage extends StatelessWidget {

  final Widget child;

  const CustomBlankPage({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: child,
        ),
      ),
    );
  }
}

class CustomBlankWithTitlePage extends StatelessWidget {

  final String title;
  final Widget child;
  final Widget? action;

  const CustomBlankWithTitlePage({
    Key? key,
    required this.title,
    required this.child,
    this.action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(title, size: 22.0, color: Colors.black87, weight: FontWeight.w500),
        actions: [ action ?? Container() ],
      ),
      body: SingleChildScrollView(
        child: child
      ),
    );
  }
}
