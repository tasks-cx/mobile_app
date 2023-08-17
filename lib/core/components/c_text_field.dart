import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          errorText: errorText,
        ));
  }
}
