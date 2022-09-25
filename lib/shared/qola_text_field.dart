import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qola_app/core/utils/key_vault.dart';
import 'package:qola_app/core/utils/size_config.dart';
import 'package:qola_app/theme/colors.dart';
import 'package:qola_app/theme/theme.dart';

class GenericFormField extends StatelessWidget {

  final String? value;
  final String? hintText;
  final String? validationText;
  final String? titleText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final Color borderColor;
  final TextInputType textInputType;
  final bool obscureText;
  final double maxWidth = 320.0;
  final double circularRadius = 15.0;
  final bool readOnly;
  final int lines;

  const GenericFormField({
    Key? key,
    this.value,
    this.hintText,
    this.validationText,
    this.titleText,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.borderColor = primaryColor,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.lines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      //width: SizeConfig.safeBlockHorizontal!*85,
        constraints: BoxConstraints(
            maxWidth: SizeConfig.safeBlockHorizontal!*85
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (titleText != null) Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(titleText!)
            ),
            BaseTextFormField(
              readOnly: readOnly,
              initialValue: value,
              onChanged: onChanged,
              textInputType: textInputType,
              textInputAction: TextInputAction.done,
              borderCircularRadius: circularRadius,
              borderColorRadius: borderColor,
              borderWidthRadius: 1.5,
              fillColor: Colors.white,
              hintText: hintText,
              fontSize: 15.0,
              obscureText: obscureText,
              counterText: validationText,
              onTap: onTap,
              minLines: lines,
              maxLines: lines,
            ),
          ],
        )
    );
  }
}

class GenericIconFormField extends StatelessWidget {
  final String? value;
  final String? hintText;
  final String? validationText;
  final String? titleText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final Color borderColor;
  final TextInputType textInputType;
  final bool obscureText;
  final double maxWidth = 320.0;
  final double circularRadius = 15.0;
  final bool readOnly;
  final int lines;
  final IconData? icon;

  const GenericIconFormField({
    Key? key,
    this.value,
    this.hintText,
    this.validationText,
    this.titleText,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.borderColor = primaryColor,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.lines = 1,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        constraints: BoxConstraints(
            maxWidth: SizeConfig.safeBlockHorizontal!*85
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (titleText != null) Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(titleText!)
            ),
            BaseTextFormField(
              readOnly: readOnly,
              initialValue: value,
              onChanged: onChanged,
              textInputType: textInputType,
              textInputAction: TextInputAction.done,
              borderCircularRadius: circularRadius,
              borderColorRadius: borderColor,
              borderWidthRadius: 1.5,
              fillColor: Colors.white,
              hintText: hintText,
              fontSize: 15.0,
              obscureText: obscureText,
              counterText: validationText,
              onTap: onTap,
              minLines: lines,
              maxLines: lines,
              isUnderline: true,
              borderUnderlineColor: textHint,
              prefixWidget: icon != null ? Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Icon(icon),
              ) : null,
            ),
          ],
        )
    );
  }
}

class GenericDropDownFormField extends StatelessWidget {

  final String? value;
  final String? hintText;
  final List<KeyVault> dataSource;
  final Function(String) onChanged;
  final String? validationText;
  final Color borderColor;
  final double circularRadius = 15.0;
  final String? titleText;

  const GenericDropDownFormField({
    Key? key,
    this.value,
    required this.dataSource,
    required this.onChanged,
    this.hintText,
    this.validationText,
    this.titleText,
    this.borderColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      constraints: BoxConstraints(
          maxWidth: SizeConfig.safeBlockHorizontal!*85
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText != null) Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(titleText!)
          ),
          BaseDropDownFormField(
            value: value,
            dataSource: dataSource,
            onChanged: onChanged,
            hintText: hintText,
            fontSize: 15.0,
            counterText: validationText,
            borderColorRadius: borderColor,
            borderCircularRadius: circularRadius,
            borderWidthRadius: 1.5,
          ),
        ],
      ),
    );
  }
}

class BaseTextFormField extends StatelessWidget {

  final TextEditingController? controller;
  final String? initialValue;
  final String labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onSubmit;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final String? prefixText;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool enabled;
  final String? counterText;
  final bool numericFormat;
  final double borderCircularRadius;
  final Color borderColorRadius;
  final double borderWidthRadius;
  final Color fillColor;
  final bool isUnderline;
  final Color borderUnderlineColor;
  final double fontSize;
  final Color fontColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final bool autoFocus;
  final bool readOnly;
  final List<TextInputFormatter>? formatters;

  const BaseTextFormField({
    Key? key,
    this.controller,
    this.initialValue,
    this.labelText = '',
    this.hintText,
    this.onChanged,
    this.onTap,
    this.onSubmit,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.suffixWidget,
    this.prefixWidget,
    this.prefixText,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.counterText,
    this.numericFormat = false,
    this.borderCircularRadius = 20.0,
    this.borderColorRadius = Colors.transparent,
    this.borderWidthRadius = 0.0,
    this.fillColor = Colors.transparent,
    this.isUnderline = false,
    this.borderUnderlineColor = Colors.black,
    this.fontSize = 20.0,
    this.fontColor = Colors.black,
    this.contentPadding,
    this.obscureText = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.formatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      scrollPhysics: const ScrollPhysics(),
      initialValue: initialValue,
      keyboardType: textInputType,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      textInputAction: textInputAction,
      maxLength: maxLength,
      obscureText: obscureText,
      style: genericTextStyle(color: fontColor, fontSize: fontSize),
      inputFormatters: formatters,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      readOnly: readOnly,
      decoration: InputDecoration(
          contentPadding: contentPadding ?? (hintText != null ? const EdgeInsets.fromLTRB(20, 10, 8, 10) : const EdgeInsets.fromLTRB(20, 10, 8, 15)),
          labelText: hintText != null ? null : labelText,
          hintText: hintText,
          alignLabelWithHint: false,
          filled: true,
          fillColor: fillColor,
          hintStyle: genericTextStyle(color: Colors.black12, fontSize: fontSize),
          counterText: counterText ?? '*',
          counterStyle: genericTextStyle(color: counterText != null ? lightColor : Colors.transparent, fontSize: fontSize*0.9),
          suffixIcon: suffixWidget,
          prefixIcon: prefixWidget,
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          border: isUnderline ? UnderlineInputBorder(
              borderSide: BorderSide(color: borderUnderlineColor, width: 0.5)
          ): OutlineInputBorder(
              borderSide: BorderSide(color: borderColorRadius, width: borderWidthRadius),
              borderRadius: BorderRadius.circular(borderCircularRadius)
          ),
          enabledBorder: isUnderline ? UnderlineInputBorder(
              borderSide: BorderSide(color: borderUnderlineColor, width: 0.5)
          ):OutlineInputBorder(
              borderSide: BorderSide(color: borderColorRadius, width: borderWidthRadius),
              borderRadius: BorderRadius.circular(borderCircularRadius)
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 20.0,
              borderSide: BorderSide(color: borderColorRadius, width: borderWidthRadius),
              borderRadius: BorderRadius.circular(borderCircularRadius)
          )
      ),
      onChanged: onChanged,
    );
  }
}

class BaseDropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String? hintText;
  final bool required;
  final dynamic value;
  final List<KeyVault> dataSource;
  final Function(String) onChanged;
  final bool filled;
  final EdgeInsetsGeometry? contentPadding;
  final double height;
  final bool? autoValidate;
  final double fontSize;
  final double borderCircularRadius;
  final double borderWidthRadius;
  final Color borderColorRadius;
  final String? counterText;

  BaseDropDownFormField({
    Key? key,
    FormFieldSetter<dynamic>? onSaved,
    FormFieldValidator<dynamic>? validator,
    this.autoValidate = false,
    this.titleText = 'Title',
    this.hintText,
    this.required = false,
    this.value,
    required this.dataSource,
    required this.onChanged,
    this.filled = true,
    this.contentPadding,
    this.fontSize = 20.0,
    this.height = 70,
    this.borderCircularRadius = 20.0,
    this.borderWidthRadius = 0.0,
    this.borderColorRadius = Colors.transparent,
    this.counterText,
  })
      : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: value,
    builder: (FormFieldState<dynamic> state) {
      return Container(
        //height: height,
        child: InputDecorator(
          //expands: true,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? (hintText != null ? const EdgeInsets.fromLTRB(20, 0, 8, 0) : const EdgeInsets.fromLTRB(20, 10, 8, 15)),
            filled: filled,
            labelStyle: genericTextStyle(fontSize: 18.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.white,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCircularRadius),
              borderSide: BorderSide(color: borderColorRadius, width: borderWidthRadius),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            counterText: counterText ?? '*',
            counterStyle: genericTextStyle(color: counterText != null ? lightColor : Colors.transparent, fontSize: fontSize*0.9),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
              isExpanded: true,
              style: genericTextStyle(fontSize: fontSize, color: textColor),
              hint: Text(
                hintText ?? '',
                style: genericTextStyle(color: Colors.black12, fontSize: fontSize),
              ),
              icon: const Flexible(
                child: Icon(Icons.arrow_drop_down, size: 40.0, color: primaryColor),
              ),
              value: value == '' ? null : value,
              onChanged: (dynamic newValue) {
                state.didChange(newValue);
                onChanged(newValue);
              },
              items: dataSource.map((item) {
                return DropdownMenuItem<dynamic>(
                  value: item.id,
                  child: Text(item.name,
                      overflow: TextOverflow.ellipsis),
                );
              }).toList(),
            ),
          ),
        ),
      );
    },
  );
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String separator = '/';
    var text = _format(
      newValue.text,
      oldValue.text,
      separator,
    );

    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(
        oldValue,
        text,
      ),
    );
  }

  String _format(
      String value,
      String oldValue,
      String separator,
      ) {
    var isErasing = value.length < oldValue.length;
    var isComplete = value.length > _maxChars + 2;

    if (!isErasing && isComplete) {
      return oldValue;
    }

    value = value.replaceAll(separator, '');
    final result = <String>[];

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      result.add(value[i]);
      if ((i == 1 || i == 3) && i != value.length - 1) {
        result.add(separator);
      }
    }

    return result.join();
  }

  TextSelection updateCursorPosition(
      TextEditingValue oldValue,
      String text,
      ) {
    var endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    var selectionEnd = text.length - endOffset;

    return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
  }
}