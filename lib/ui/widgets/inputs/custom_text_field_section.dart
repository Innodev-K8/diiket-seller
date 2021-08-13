import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';

import 'custom_text_form_field.dart';

class CustomTextFieldSection extends StatelessWidget {
  const CustomTextFieldSection({
    Key? key,
    required this.title,
    this.inputHint,
    this.helpText,
    this.inputMinLines,
    this.inputMaxLines,
  }) : super(key: key);

  final String title;
  final String? helpText;

  final String? inputHint;
  final int? inputMinLines;
  final int? inputMaxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTextTheme.headline3!.copyWith(
            color: ColorPallete.accentColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          hint: inputHint,
          minLines: inputMinLines,
          maxLines: inputMaxLines,
        ),
        if (helpText != null) ...[
          SizedBox(
            height: 4,
          ),
          Text(
            helpText!,
            style: kTextTheme.subtitle2!.copyWith(color: ColorPallete.darkGray),
          ),
        ]
      ],
    );
  }
}
