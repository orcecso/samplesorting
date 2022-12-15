import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/styles.dart';

class PrimaryTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? label;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? inputController;
  final void Function(String)? onChanged;
  final Function? onTap;
  final String hintText;
  final id;
  final int maxLines;
  final Color labelColor;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? errorText;
  final Color textColor;
  final bool enabled;
  final bool enableInteractiveSelection;
  final bool readOnly;
  final Widget? prefix;
  final int minLines;
  final TextStyle? style;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final TextStyle? labelStyle;
  final initialValue;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final double? borderRadius;
  final FormFieldValidator<String>? validator;
  final Color? fillColor;
  final bool isRequired;
  final Color? underlineColor;
  final int? maxLength;
  final bool hasError;
  final bool isdense;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? textInputFormatters;
  final int? errorMaxLines;
  final TextStyle? errorStyle;

  const PrimaryTextField(
      {this.label,
      this.labelText,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.sentences,
      this.contentPadding,
      this.inputController,
      this.onChanged,
      this.onTap,
      this.hintText = '',
      this.maxLines = 1,
      this.labelColor = TEXT_GRAY_COLOR,
      this.focusNode,
      this.nextFocusNode,
      this.errorText,
      this.id = '',
      this.textColor = TEXT_GRAY_COLOR,
      this.enabled = true,
      this.enableInteractiveSelection = true,
      this.readOnly = false,
      this.prefix,
      this.minLines = 1,
      this.style,
      this.textAlignVertical,
      this.textAlign,
      this.labelStyle,
      this.initialValue,
      this.textInputAction,
      this.onFieldSubmitted,
      this.borderRadius,
      this.validator,
      this.fillColor,
      this.isRequired = false,
      this.underlineColor,
      this.maxLength,
      this.textInputFormatters,
      this.hasError = false,
      this.isdense = false,
      Key? key,
      this.prefixIcon,
      this.errorStyle,
      this.errorMaxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        validator: _onValidate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: textInputFormatters,
        initialValue: initialValue,
        textInputAction: textInputAction,
        onFieldSubmitted: (value) => _onFieldSubmitted(context, value),
        textCapitalization: textCapitalization,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        enabled: enabled,
        maxLength: maxLength,
        enableInteractiveSelection: enableInteractiveSelection,
        focusNode: focusNode,
        maxLines: maxLines,
        onTap: onTap as void Function()?,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: inputController,
        readOnly: readOnly,
        minLines: minLines,
        style: style ??
            TextStyle(
              fontFamily: 'Roboto',
              color: textColor,
              fontWeight: FontWeight.w300,
              fontSize: 12,
              height: 14.06 / 12,
              decoration: TextDecoration.none,
            ),
        decoration: InputDecoration(
          // label: label != null ? label : Text(labelText ?? ''),
          labelText: labelText,
          prefix: prefix,
          errorText: errorText,
          errorStyle: errorStyle,
          // errorStyle: const TextStyle(fontSize: 1),
          hintText: readOnly ? null : hintText,
          // counterText: "",
          isDense: isdense,
          fillColor: fillColor ?? WHITE_COLOR,
          hintStyle: TextStyle(color: TEXT_GRAY_COLOR),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(maxHeight: 60),
          errorMaxLines: errorMaxLines,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: ALERT_COLOR,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: ALERT_COLOR,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: TEXT_GRAY_COLOR, width: 1.0),
          ),
          focusedBorder: readOnly
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: TEXT_GRAY_COLOR, width: 1.0),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: GREEN_COLOR,
                    width: 1.0,
                  ),
                ),
          filled: true,
          labelStyle: labelStyle ??
              TextStyle(
                color: labelColor,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
        ),
      );

  _onFieldSubmitted(BuildContext context, String value) {
    if (textInputAction == TextInputAction.next && nextFocusNode != null) {
      nextFocusNode!.requestFocus();
    }
    onFieldSubmitted?.call(value);
  }

  String? _onValidate(String? value) {
    if ((value?.isEmpty ?? true) && isRequired) {
      return "$labelText is required";
    }
    return validator?.call(value);
  }
}
