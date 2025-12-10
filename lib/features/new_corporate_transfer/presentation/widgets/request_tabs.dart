import 'package:flutter/material.dart';

class RequestTabs extends StatelessWidget {
  final int selectedIndex;
  final int receivedCount;
  final int sentCount;
  final Function(int) onTabChange;

  const RequestTabs({
    super.key,
    required this.selectedIndex,
    required this.receivedCount,
    required this.sentCount,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.035, right: width * 0.035),
      child: Row(
        children: [
          _buildTab(
            context,
            label: "Received ($receivedCount)",
            index: 0,
            isSelected: selectedIndex == 0,
          ),
          SizedBox(width: width * 0.03),
          _buildTab(
            context,
            label: "Sent ($sentCount)",
            index: 1,
            isSelected: selectedIndex == 1,
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required String label,
    required int index,
    required bool isSelected,
  }) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onTabChange(index),
      child: Container(
        width: width * 0.45,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: width * 0.03,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF0080FF) : Color(0xFFE7F4FF),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.035,
            ),
          ),
        ),
      ),
    );
  }
}
