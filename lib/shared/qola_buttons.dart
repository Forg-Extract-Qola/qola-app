import 'package:flutter/material.dart';
import 'package:qola_app/core/utils/size_config.dart';
import 'package:qola_app/shared/qola_texts.dart';
import 'package:qola_app/theme/colors.dart';

class LargeLightButton extends StatelessWidget {

  final Widget? child;
  final String? text;
  final Function? onPressed;

  const LargeLightButton({
    this.child,
    this.text,
    this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: SizeConfig.safeBlockHorizontal!*90,
        height: 45.0,
        constraints: const BoxConstraints(
            maxWidth: 350.0,
            maxHeight: 65.0
        ),
        child: MaterialButton(
          color: lightColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          splashColor: Colors.transparent,
          onPressed: () => onPressed?.call(),
          child: child ?? TextBold(text ?? '')
        )
      ),
    );
  }
}

class LargeAccentButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Function? onPressed;

  const LargeAccentButton({
    this.child,
    this.text,
    this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          width: SizeConfig.safeBlockHorizontal!*90,
          height: 45.0,
          constraints: const BoxConstraints(
              maxWidth: 350.0,
              maxHeight: 65.0
          ),
          child: MaterialButton(
              color: registerColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              splashColor: Colors.transparent,
              onPressed: () => onPressed?.call(),
              child: child ?? TextBold(text ?? '', color: textAccentColor)
          )
      ),
    );
  }
}

class LargeSolidButton extends StatelessWidget {

  final Function()? onPressed;
  final String? text;
  final Widget? child;

  const LargeSolidButton({
    Key? key,
    this.onPressed,
    this.text,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        width: SizeConfig.safeBlockHorizontal!*80,
        height: 45.0,
        constraints: const BoxConstraints(
            maxWidth: 320.0,
            maxHeight: 65.0
        ),
        child: MaterialButton(
            color: primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            splashColor: Colors.transparent,
            onPressed: onPressed,
            child: child ?? TextBold(text ?? '')
        )
      ),
    );
  }
}
