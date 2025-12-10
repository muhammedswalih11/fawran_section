import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class LimitsBottomSheet extends StatelessWidget {
  const LimitsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          Text(
            "Limits",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: DefaultColors.grayE5),
              color: DefaultColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum amount per transaction",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        "0.01 QAR",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                Divider(color: Colors.grey.shade400),

                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    top: screenHeight * 0.01,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maximum amount per transaction",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        "100,000.00 QAR",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
