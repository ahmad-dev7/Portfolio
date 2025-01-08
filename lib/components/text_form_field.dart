import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextCapitalization capitalization;
  final bool Function(String?) validatorCondition;
  final String validatorMsg;
  final String hintText;
  final String labelText;
  final bool? showCounter;
  final TextInputAction inputAction;
  final Function(String?) onChange;
  const MyTextFormField({
    super.key,
    required this.keyboardType,
    this.maxLength,
    required this.capitalization,
    required this.validatorCondition,
    required this.validatorMsg,
    required this.hintText,
    required this.labelText,
    required this.onChange,
    this.minLines,
    this.maxLines,
    this.showCounter,
    required this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textCapitalization: capitalization,
      validator: (val) => validatorCondition(val) ? validatorMsg : null,
      textInputAction: inputAction,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hintText,
        // if it is null then it will show counter
        counterText: showCounter == null ? '' : null,
        alignLabelWithHint: true,
        // errorStyle: const TextStyle(height: 0.5),
        fillColor: Theme.of(context).dividerColor.withOpacity(.1),
        counterStyle: const TextStyle(height: double.minPositive),
        label: Opacity(opacity: 0.9, child: MyText(labelText)),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
