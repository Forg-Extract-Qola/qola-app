import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qola_app/core/utils/hex_color.dart';
import 'package:qola_app/theme/colors.dart';
import 'package:qola_app/theme/theme.dart';

class TextTitle extends StatelessWidget {

  final String text;

  const TextTitle(this.text, {
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: genericTextStyle(fontWeight: FontWeight.bold, fontSize: 30.0));
  }
}

class TextParagraph extends StatelessWidget {

  final String text;

  const TextParagraph(this.text, {
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(text: text, style: genericTextStyle(fontWeight: FontWeight.normal)),
      ),
    );
  }
}

class TextLink extends StatelessWidget {
  final String description;
  final Function()? onPressed;
  final double maxWidth = 300;

  const TextLink({
    Key? key,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: maxWidth
      ),
      child: RichText(
          text: TextSpan(
              text: description,
              style: genericTextStyle(color: primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = onPressed
          )
      ),
    );
  }
}



class TextBold extends StatelessWidget {

  final String text;
  final Color color;

  const TextBold({
    required this.text,
    this.color = textColor,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: genericTextStyle(fontWeight: FontWeight.bold, color: color));
  }
}
