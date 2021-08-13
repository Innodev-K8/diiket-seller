import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';

class CustomTextFormField extends StatelessWidget {
  
  final String? hint;
  final int? minLines;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    this.hint,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: minLines != null && minLines! > 1 ? 12 : 0,
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
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
