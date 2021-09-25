import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.labelText,
    required this.validator,
    this.focusNode,
    this.isAutoFocused = false,
    this.isInputDisabled = false,
    this.obscureText = false,
    this.errorText,
    this.inputTextStyle,
    this.labelTextStyle,
    this.errorTextStyle,
    this.suffix,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
  });

  ///For Controlling the text input
  final TextEditingController controller;

  ///Focus Node lets you manipulate the focus of the text field
  final FocusNode? focusNode;

  ///If [isAutoFocused] is set to true then the text field will be AutoFocused
  ///
  ///[Initial value is false]
  final bool isAutoFocused;

  ///Validator is required by default
  ///
  ///If validator returns null that means the input is valid
  ///
  ///Else the string returned will be displayed as error
  final String? Function(String?)? validator;

  ///Its a value changed of string callback
  final ValueChanged<String>? onChanged;

  ///It is triggered when user presses keyboard action button
  final ValueChanged<String>? onFieldSubmitted;

  ///If set to true the input is disabled
  ///
  ///[Initial Value is false]
  final bool isInputDisabled;

  ///If true then text appears as code
  ///
  ///[Initial value is false]
  final bool obscureText;

  ///It controls the action button on the keyboard
  ///
  ///[Initial value is TextInputAction.done]
  final TextInputAction textInputAction;

  ///Label Text which shifts while editing
  final String labelText;

  ///If errorText is null that means there are no errors
  final String? errorText;

  ///Controls what type of text can be inputted
  ///
  ///[Default value is TextInputType.text]
  final TextInputType textInputType;

  ///Defines the style of input text
  final TextStyle? inputTextStyle;

  ///Defines the style of label text
  final TextStyle? labelTextStyle;

  ///Defines the style of error text
  final TextStyle? errorTextStyle;

  ///Suffix Widget for the text field
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: isAutoFocused,
      enabled: !isInputDisabled,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: inputTextStyle,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        labelStyle: labelTextStyle,
        errorStyle: errorTextStyle,
        suffix: suffix,
      ),
    );
  }
}
