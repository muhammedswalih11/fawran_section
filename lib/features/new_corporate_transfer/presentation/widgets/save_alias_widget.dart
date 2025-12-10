import 'package:fawran/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SaveAliasWidget extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  const SaveAliasWidget({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          // ---- CUSTOM CHECKBOX ----
          Container(
            width: width * 0.06,
            height: width * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF0A65C3), width: 2),
              color: isChecked ? const Color(0xFF0A65C3) : Colors.transparent,
            ),
            child: isChecked
                ? Icon(Icons.check, size: width * 0.045, color: Colors.white)
                : null,
          ),

          SizedBox(width: width * 0.025),

          // ---- TEXT ----
          Text(
            "Save Alias",
            style: TextStyle(
              color: DefaultColors.flatblue,
              fontSize: width * 0.040,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
