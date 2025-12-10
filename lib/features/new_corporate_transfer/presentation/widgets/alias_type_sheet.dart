import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/providers.dart';

class FawranAliasTypeSheet extends ConsumerWidget {
  const FawranAliasTypeSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
        top: height * 0.015,
        left: width * 0.05,
        right: width * 0.05,
        bottom: height * 0.03,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// --- DRAG HANDLE ---
          Center(
            child: Container(
              height: height * 0.006,
              width: width * 0.20,
              decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          SizedBox(height: height * 0.02),

          /// --- TITLE ---
          Text(
            "Fawran Alias Type",
            style: TextStyle(
              fontSize: width * 0.060,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          SizedBox(height: height * 0.03),

          /// --- OPTIONS LIST ---
          _aliasTile(context, ref, "Corporate IBAN"),
          _divider(),

          _aliasTile(context, ref, "Commercial Registration (CR)"),
          _divider(),

          _aliasTile(context, ref, "Commercial License (CL)"),
          _divider(),

          _aliasTile(context, ref, "Establishment Registration (ER)"),
        ],
      ),
    );
  }

  /// --- SINGLE ROW TILE ---
  Widget _aliasTile(BuildContext context, WidgetRef ref, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: Colors.black54,
      ),
      onTap: () {
        ref.read(selectedBeneficiaryAliasTypeProvider.notifier).state = title;
        Navigator.pop(context, title);
      },
    );
  }

  /// --- DIVIDER ---
  Widget _divider() {
    return Container(
      height: 1,
      color: Color(0xFFE4E4E4),
      margin: EdgeInsets.only(bottom: 4),
    );
  }
}
