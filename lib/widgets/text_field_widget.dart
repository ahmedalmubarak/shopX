import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../../constants/scales.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hint,
    required this.label,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.isPassword = false,
    this.suffixIcon,
  }) : super(key: key);
  final String hint, label;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? isPassword;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        obscureText: isPassword!,
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 15),
          label: Text(label),
          contentPadding: const EdgeInsets.all(10),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
