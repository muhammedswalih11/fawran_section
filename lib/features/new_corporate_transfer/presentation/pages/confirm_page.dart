import 'package:fawran/features/new_corporate_transfer/presentation/widgets/fawran_success.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/transfer_card.dart';

class ConfirmPage extends StatefulWidget {
  final Map<String, String> transferDataOfWithinFawran;
  const ConfirmPage({super.key, required this.transferDataOfWithinFawran});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screenHeight * 0.035),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 7, 110, 141),
              DefaultColors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: DefaultColors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Confirm Transfer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04,
                    bottom: screenHeight * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Make sure the below transfer details are correct',
                        style: TextStyle(
                          fontSize: screenWidth * 0.036,
                          color: DefaultColors.grayMedBase,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FawranTransfercard(
                                fromAccount: widget
                                    .transferDataOfWithinFawran["fromAccount"]!,
                                beneficiaryAliasType: widget
                                    .transferDataOfWithinFawran["beneficiaryAliasType"]!,
                                beneficiaryAlias: widget
                                    .transferDataOfWithinFawran["beneficiaryAlias"]!,
                                beneficiaryFullName: widget
                                    .transferDataOfWithinFawran["beneficiaryFullName"]!,
                                beneficiaryBankName: widget
                                    .transferDataOfWithinFawran["beneficiaryBankName"]!,
                                purposeofTransfer: widget
                                    .transferDataOfWithinFawran["purposeofTransfer"]!,
                                subPurposeofTransfer: widget
                                    .transferDataOfWithinFawran["subPurposeofTransfer"]!,
                                totaldebitAmount: widget
                                    .transferDataOfWithinFawran["totaldebitAmount"]!,
                                remarks: widget
                                    .transferDataOfWithinFawran["remarks"]!,
                                fees: double.parse(
                                  widget.transferDataOfWithinFawran["fees"]!,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
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
                                      '${widget.transferDataOfWithinFawran["fees"]} QAR',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.040,
                                        fontWeight: FontWeight.w700,
                                        color: DefaultColors.black,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.008),
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.w400,
                                        color: DefaultColors.grayMedBase,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      '${widget.transferDataOfWithinFawran["totaldebitAmount"]} QAR',
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
                      SizedBox(height: screenHeight * 0.02),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print("Confirm button pressed"); // Debug
                            try {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  print(
                                    "Building FawranSuccess modal",
                                  ); // Debug
                                  return FawranSuccess(
                                    data: widget.transferDataOfWithinFawran,
                                  );
                                },
                              );
                            } catch (e) {
                              print("Error showing modal: $e"); // Debug
                            }
                          },
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
                            'Confirm',
                            style: TextStyle(
                              color: DefaultColors.white,
                              fontSize: screenWidth * 0.043,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
