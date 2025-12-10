import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/providers.dart';

class BeneficiaryAliasSelector extends ConsumerWidget {
  const BeneficiaryAliasSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(beneficiaryAliasTypeProvider);
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -------- GREY TITLE --------
        Text(
          "Beneficiary Alias",
          style: TextStyle(
            fontSize: width * 0.045,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: width * 0.035),

        /// -------- TWO BUTTON ROW --------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOption(
              label: "Existing",
              index: 0,
              isSelected: selectedIndex == 0,
              width: width,
              onTap: () =>
                  ref.read(beneficiaryAliasTypeProvider.notifier).setType(0),
            ),

            _buildOption(
              label: "New",
              index: 1,
              isSelected: selectedIndex == 1,
              width: width,
              onTap: () =>
                  ref.read(beneficiaryAliasTypeProvider.notifier).setType(1),
            ),
          ],
        ),
      ],
    );
  }

  /// -------- SINGLE BUTTON --------
  Widget _buildOption({
    required String label,
    required int index,
    required bool isSelected,
    required double width,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.40,
        padding: EdgeInsets.symmetric(
          vertical: width * 0.035,
          horizontal: width * 0.10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3FA1E0) : Color(0xFFE8F2FA),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: width * 0.040,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Color(0xFF002C6A),
            ),
          ),
        ),
      ),
    );
  }
}
