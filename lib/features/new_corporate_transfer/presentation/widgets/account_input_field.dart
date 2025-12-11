import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class AccountInputField extends StatefulWidget {
  final String labeltext;
  final Map<String, String>? selectedValue;
  final VoidCallback onTap;

  const AccountInputField({
    super.key,
    required this.labeltext,
    required this.onTap,
    this.selectedValue,
  });

  @override
  State<AccountInputField> createState() => _AccountInputFieldState();
}

class _AccountInputFieldState extends State<AccountInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If selected -> show value
    if (widget.selectedValue != null) {
      _controller.text =
          '${widget.selectedValue!['title']} (${widget.selectedValue!['accnumber']})';
    } else {
      // If NOT selected -> controller empty (VERY IMPORTANT)
      _controller.text = '';
    }

    return CustomInputField(
      label: widget.labeltext, // floating label only
      value: '', // <<< must be empty to avoid double label
      showDropdown: true,
      onTap: widget.onTap,
      controller: _controller,
    );
  }
}
