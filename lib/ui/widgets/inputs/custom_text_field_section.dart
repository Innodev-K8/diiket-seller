import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';

import 'custom_text_form_field.dart';

class CustomTextFieldSection extends StatelessWidget {
  const CustomTextFieldSection({
    Key? key,
    required this.title,
    this.inputHint,
    this.helpText,
  }) : super(key: key);

  final String title;
  final String? inputHint;
  final String? helpText;

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
