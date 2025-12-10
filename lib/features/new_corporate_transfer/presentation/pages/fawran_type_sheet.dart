import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class FawranTypeSheet extends StatelessWidget {
  FawranTypeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: const BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: screenHeight * 0.005,
          right: screenHeight * 0.005,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: screenHeight * 0.006,
              width: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: DefaultColors.graylight,
                borderRadius: BorderRadius.circular(50),
              ),
              margin: const EdgeInsets.only(bottom: 14),
            ),
            SizedBox(height: screenHeight * 0.01),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Fawran Type",
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.018,
                bottom: screenHeight * 0.015,
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context, "individual"),
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.050,
                      width: screenHeight * 0.050,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAF3FB),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: screenHeight * 0.028,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Individual",
                          style: TextStyle(
                            fontSize: screenWidth * 0.042,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Start a fawran transfer to an individual alias.",
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),

            // Corporate option
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.015,
                bottom: screenHeight * 0.015,
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context, "corporate"),
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.050,
                      width: screenHeight * 0.050,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAF3FB),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.apartment_outlined,
                        size: screenHeight * 0.028,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Corporate",
                          style: TextStyle(
                            fontSize: screenWidth * 0.042,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Start a fawran transfer to a corporate alias.",
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
