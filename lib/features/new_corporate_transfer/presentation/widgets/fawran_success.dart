import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/colors.dart';
import 'share_action.dart';
import 'transfer_card.dart';

class FawranSuccess extends StatelessWidget {
  final Map<String, String> data;
  const FawranSuccess({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
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
                      margin: EdgeInsets.only(bottom: 14),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Image.asset(
                      'assets/gif/task_success_gif.gif',
                      width: screenWidth * 0.25,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: screenWidth * 0.25,
                        );
                      },
                    ),

                    Text(
                      "Transfer Successful",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: DefaultColors.black,
                      ),
                    ),
                    Text(
                      _formattedDateTime(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: DefaultColors.grayMedBase,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Container(
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: DefaultColors.grayE4,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("From account", context),
                                value(data["fromAccount"] ?? "", context),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Beneficiary Alias Type", context),
                                value(
                                  data["beneficiaryAliasType"] ?? "",
                                  context,
                                ),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Beneficiary alias", context),
                                value(data["beneficiaryAlias"] ?? "", context),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Reference Number", context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    value(data["reference"] ?? "N/A", context),
                                    GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: data["reference"] ?? "",
                                          ),
                                        );

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Copied to clipboard",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),

                                            duration: Duration(seconds: 1),
                                            behavior: SnackBarBehavior.floating,
                                            margin: const EdgeInsets.all(16),
                                          ),
                                        );
                                      },
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(3.14159),
                                        child: Icon(
                                          Icons.copy_sharp,

                                          size: 20,
                                          color: DefaultColors.flatblue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Beneficiary full name", context),
                                value(
                                  data["beneficiaryFullName"] ?? "",
                                  context,
                                ),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Beneficiary bank name", context),
                                value(
                                  data["beneficiaryBankName"] ?? "",
                                  context,
                                ),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Amount", context),
                                value(data["amount"] ?? "", context),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Purpose of Transfer", context),
                                value(data["purposeofTransfer"] ?? "", context),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Sub Purpose of Transfer", context),
                                value(
                                  data["subPurposeofTransfer"] ?? "",
                                  context,
                                ),
                              ],
                            ),
                          ),
                          divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.02,
                              bottom: screenHeight * 0.012,
                              right: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Total Debit Amount", context),
                                value(
                                  "${data["totaldebitAmount"] ?? "0.00"} QAR ",
                                  context,
                                ),
                              ],
                            ),
                          ),
                          divider(),

                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label("Remarks", context),
                                value(data["remarks"] ?? "", context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Container(
                      width: screenWidth,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: DefaultColors.lightblue1,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fees',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w400,
                              color: DefaultColors.grayMedBase,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            '${data["fees"] ?? "0.00"} QAR',
                            style: TextStyle(
                              fontSize: screenWidth * 0.040,
                              fontWeight: FontWeight.w700,
                              color: DefaultColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fixed bottom section - Share actions and Done button
          Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(color: DefaultColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShareActionRow(text: 'Share as Pdf', onTap: () async {}),
                    SizedBox(width: screenWidth * 0.15),
                    ShareActionRow(text: "Share as Image", onTap: () {}),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColors.dashboarddarkBlue,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.013,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: screenWidth * 0.043,
                        fontWeight: FontWeight.w400,
                        color: DefaultColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formattedDateTime() {
  final now = DateTime.now();
  final formatter = DateFormat("d MMMM yyyy . h:mma");
  return formatter.format(now).replaceAll("AM", "AM").replaceAll("PM", "PM");
}
