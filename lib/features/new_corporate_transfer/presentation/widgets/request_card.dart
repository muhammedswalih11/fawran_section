import 'package:flutter/material.dart';
import '../data/models.dart';

class RequestCard extends StatelessWidget {
  final RequestItem item;

  const RequestCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.03),
        Container(
          height: screenHeight * 0.16,
          width: screenWidth * 0.65,
          margin: const EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.all(screenWidth * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Color(0xFFE6E6E6)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    decoration: BoxDecoration(
                      color: Color(0xFFE7F4FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item.isReceived
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: Color(0xFF0080FF),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.amount,
                        style: TextStyle(
                          fontSize: screenWidth * 0.038,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        item.status,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.018),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      Text(
                        item.alias,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: screenWidth * 0.030,
                        ),
                      ),
                    ],
                  ),

                  if (item.timeLeft.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFE7F4FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item.timeLeft,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0080FF),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
