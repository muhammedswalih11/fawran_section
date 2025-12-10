import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String value;
  final bool showDropdown;
  final VoidCallback? onTap;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final bool isReadOnly;
  final bool isVerified;

  const CustomInputField({
    super.key,
    required this.label,
    this.value = '',
    this.showDropdown = false,

    this.onTap,
    this.suffixWidget,
    this.controller,
    this.inputType,
    this.onChanged,
    this.isReadOnly = false,
    this.isVerified = false,
  });

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: DefaultColors.grayE5, width: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return TextFormField(
      controller: controller,
      initialValue: controller == null ? value : null,
      onChanged: onChanged,
      readOnly: isReadOnly || onTap != null,
      onTap: onTap,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: screenWidth * 0.038,
          color: DefaultColors.gray7D,
          fontWeight: FontWeight.w400,
        ),
        filled: isVerified,
        fillColor: isVerified ? DefaultColors.grayE5 : null,

        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),

        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isVerified)
              Container(
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                margin: EdgeInsets.only(right: screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: screenWidth * 0.04,
                ),
              ),
            if (!isVerified && suffixWidget != null)
              Padding(
                padding: EdgeInsets.only(
                  right: showDropdown ? 0 : screenWidth * 0.04,
                ),
                child: suffixWidget!,
              ),
            if (!isVerified && showDropdown)
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: screenWidth * 0.06,
              ),
          ],
        ),

        suffixIconConstraints: BoxConstraints(
          minWidth: showDropdown ? screenWidth * 0.1 : 0,
          minHeight: screenHeight * 0.05,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
      ),
      style: TextStyle(fontSize: screenWidth * 0.038),
    );
  }
}
