import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class CustomVerifiedField extends StatelessWidget {
  final String label;
  final String value;

  const CustomVerifiedField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.018,
        horizontal: screenWidth * 0.040,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: DefaultColors.grayE5, width: 1.0),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---- LABEL (same style as CustomInputField label) ----
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.038,
              color: DefaultColors.gray7D,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: screenHeight * 0.005),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// ---- VALUE ----
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: screenWidth * 0.040,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.black,
                  ),
                ),
              ),

              /// ---- GREEN CHECK ICON ----
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: screenWidth * 0.07,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
