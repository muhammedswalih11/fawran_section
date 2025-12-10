import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AliasCard extends StatelessWidget {
  final String idNumber;
  final String account;
  final String iban;
  final String iconSvg;
  final VoidCallback? onMoreOptions;

  const AliasCard({
    super.key,
    required this.idNumber,
    required this.account,
    required this.iban,
    required this.iconSvg,
    this.onMoreOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.only(top: 5, left: 14, bottom: 5, right: 14),
          // margin: EdgeInsets.only(right: 12),
          width: 340,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SVG ICON
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(iconSvg, height: 30),
              ),

              const SizedBox(width: 12),

              // TEXT SECTION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      idNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      account,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      iban,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

              // MORE OPTIONS
              InkWell(
                onTap: onMoreOptions,
                child: const Icon(Icons.more_vert, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
