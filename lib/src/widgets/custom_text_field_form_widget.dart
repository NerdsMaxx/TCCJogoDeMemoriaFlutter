import 'package:flutter/material.dart';

class CustomTextFieldFormWidget extends StatelessWidget {
  const CustomTextFieldFormWidget({
    super.key,
    required this.hintText,
    this.initialValue,
    this.onChanged,
    this.obscureText = false,
    this.autocorrect = true,
    this.validator,
    this.style,
  });

  final String? Function(String?)? validator;
  final String hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool autocorrect;
  final TextStyle? style;

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
    );
  }
}
