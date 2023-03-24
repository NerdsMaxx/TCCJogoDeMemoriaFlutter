import 'package:flutter/material.dart';

class CustomTextFieldFormWidget extends StatelessWidget {
  const CustomTextFieldFormWidget({
    super.key,
    this.hintText,
    this.initialValue,
    this.onChanged,
    this.obscureText = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.validator,
    this.style,
    this.maxLength,
  });

  final String? Function(String?)? validator;
  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool autocorrect;
  final bool autofocus;
  final TextStyle? style;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      style: style ?? Theme.of(context).textTheme.headlineSmall,
      obscureText: obscureText,
      autocorrect: autocorrect,
      autofocus: autofocus,
      maxLength: maxLength,
    );
  }
}
