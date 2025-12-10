import 'package:fawran/core/utils/colors.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Expanded(
        child: Text(
          'Payment Refund can only be initiated by the beneficiary. Please ensure all information is entered correctly',
          style: TextStyle(
            fontSize: screenWidth * 0.038,
            color: DefaultColors.grayBase,
          ),
        ),
      ),
    );
  }
}
