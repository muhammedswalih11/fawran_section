import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class RemarksField extends StatelessWidget {
  final TextEditingController controller;
  const RemarksField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Remarks (Optional)',
      controller: controller,
    );
  }
}
