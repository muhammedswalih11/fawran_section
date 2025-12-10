import 'package:flutter/material.dart';

import '../data/models.dart';

class RecentTransactionTile extends StatelessWidget {
  final RecentTransaction tx;

  const RecentTransactionTile({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Avatar building (image or initials)
    Widget avatar;
    if (tx.avatar != null && tx.avatar!.isNotEmpty) {
      avatar = CircleAvatar(
        radius: screenWidth * 0.055,
        backgroundImage: AssetImage(tx.avatar!),
      );
    } else {
      // Name initials
      final initials = tx.name
          .split(" ")
          .map((e) => e.isNotEmpty ? e[0] : "")
          .take(2)
          .join();

      avatar = CircleAvatar(
        radius: screenWidth * 0.055,
        backgroundColor: const Color(0xFFE8F0FA),
        child: Text(
          initials,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: screenWidth * 0.04,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: screenWidth * 0.02,
      ),
      child: Row(
        children: [
          avatar,

          SizedBox(width: screenWidth * 0.04),

          // Name + Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.name,
                style: TextStyle(
                  fontSize: screenWidth * 0.037,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                tx.dateLabel,
                style: TextStyle(
                  fontSize: screenWidth * 0.029,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          Spacer(),

          // Amount on right
          Text(
            tx.amount,
            style: TextStyle(
              fontSize: screenWidth * 0.037,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
