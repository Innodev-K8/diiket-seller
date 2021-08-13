import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hint,
  }) : super(key: key);

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorPallete.primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorPallete.lightGray,
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
