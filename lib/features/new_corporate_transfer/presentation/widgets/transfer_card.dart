import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class FawranTransfercard extends StatelessWidget {
  final String fromAccount;
  final String beneficiaryAliasType;
  final String beneficiaryAlias;
  final String beneficiaryFullName;
  final String beneficiaryBankName;
  final String purposeofTransfer;
  final String subPurposeofTransfer;
  final String totaldebitAmount;
  final String remarks;
  final double fees;
  const FawranTransfercard({
    super.key,
    required this.fromAccount,
    required this.beneficiaryAliasType,
    required this.beneficiaryAlias,
    required this.beneficiaryFullName,
    required this.beneficiaryBankName,

    required this.purposeofTransfer,
    required this.subPurposeofTransfer,
    required this.totaldebitAmount,
    required this.remarks,
    required this.fees,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      width: screenWidth,

      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: DefaultColors.grayE4, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("From account", context),
                value(fromAccount, context),
              ],
            ),
          ),

          divider(),

          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Beneficiary Alias Type", context),
                value(beneficiaryAliasType, context),
              ],
            ),
          ),

          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Beneficiary Alias", context),
                value(beneficiaryAlias, context),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Beneficiary full name", context),
                value(beneficiaryFullName, context),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Beneficiary Bank name", context),
                value(beneficiaryBankName, context),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Purpose of Transfer", context),
                value(purposeofTransfer, context),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Sub Purpose of Transfer", context),
                value(subPurposeofTransfer, context),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Total Debit Amount", context),
                value("$totaldebitAmount QAR", context),
              ],
            ),
          ),

          divider(),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.012,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label("Remarks", context), value(remarks, context)],
            ),
          ),
        ],
      ),
    );
  }
}

Widget divider() {
  return Container(
    height: 1,
    width: double.infinity,
    color: DefaultColors.grayE4,
  );
}

Widget label(String text, BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;

  return Text(
    text,
    style: TextStyle(
      fontSize: screenWidth * 0.035,
      color: DefaultColors.grayMedBase,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget value(String text, BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;

  return Text(
    text,
    style: TextStyle(
      fontSize: screenWidth * 0.037,
      fontWeight: FontWeight.w500,
      color: DefaultColors.black,
    ),
  );
}
