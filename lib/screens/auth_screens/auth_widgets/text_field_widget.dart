import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final String? Function(String?) validator;
  final Function(String? value) onSaved;
  final TextInputType? textInputType;
  final TextEditingController? controller;

  const TextFieldWidget(
      {required this.text,
      required this.onSaved,
      required this.validator,
      this.textInputType,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        filled: true,
        fillColor: const Color(0xff989898),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
