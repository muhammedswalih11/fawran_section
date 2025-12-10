import 'package:fawran/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final VoidCallback? onAdd;
  final bool showAdd;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
    this.onAdd,
    this.showAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              TextButton(
                onPressed: onViewAll,
                child: const Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0080FF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showAdd)
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: DefaultColors.flatblue,
                    size: screenWidth * 0.07,
                  ),
                  onPressed: onAdd,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
