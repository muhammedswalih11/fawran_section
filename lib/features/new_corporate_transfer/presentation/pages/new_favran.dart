import 'package:fawran/features/new_corporate_transfer/presentation/widgets/alias_type_sheet.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/amount_field.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/beneficairy_alias_bar.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/custom_input_field.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/infotext.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/remarks_field.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/save_alias_widget.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/colors.dart';
import '../controllers/providers.dart';
import '../widgets/account_input_field.dart';
import '../widgets/account_picker_sheet.dart';
import '../widgets/limit_bottom_sheet.dart';
import '../widgets/limit_info_tile.dart';
import '../widgets/purpose_of_transfer.dart';
import '../widgets/universal_purpose_sheet.dart';
import 'confirm_page.dart';
import 'fawran_type_sheet.dart';

class NewFawranPage extends ConsumerWidget {
  const NewFawranPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final isChecked = ref.watch(saveAliasProvider);
    final amountController = ref.watch(amountControllerProvider);
    final remarksController = ref.watch(remarksControllerProvider);
    final selectedFromAccount = ref.watch(selectedFromAccountProvider);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35),
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
                  'New Fawran Transfer',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: DefaultColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.025),
            Expanded(
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  color: DefaultColors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.050,
                            left: screenWidth * 0.040,
                            right: screenWidth * 0.040,
                            bottom: screenHeight * 0.020,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              // CustomInputField(
                              //   label: 'Transfer from Account',
                              //   // value: selectedFromAccount != null
                              //   //     ? '${selectedFromAccount['title']} - ${selectedFromAccount['accnumber']}'
                              //   //     : '',

                              //   showDropdown: true,
                              //   onTap: () {
                              //     showModalBottomSheet(
                              //       context: context,
                              //       isScrollControlled: true,
                              //       shape: const RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.vertical(
                              //           top: Radius.circular(25),
                              //         ),
                              //       ),
                              //       builder: (_) {
                              //         return AccountPickerSheet(
                              //           title: "Select From Account",
                              //           subtitle:
                              //               "Choose the account you'd like to transfer from",
                              //           onSelected: (acct) {
                              //             ref
                              //                     .read(
                              //                       selectedFromAccountProvider
                              //                           .notifier,
                              //                     )
                              //                     .state =
                              //                 acct;

                              //             Navigator.pop(context);
                              //           },
                              //         );
                              //       },
                              //     );
                              //   },
                              // ),
                              AccountInputField(
                                labeltext: 'From Account',

                                selectedValue: selectedFromAccount,
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (_) {
                                      return AccountPickerSheet(
                                        title: "Select From Account",
                                        subtitle:
                                            "Choose the account you'd like to transfer from",
                                        onSelected: (acct) {
                                          ref
                                                  .read(
                                                    selectedFromAccountProvider
                                                        .notifier,
                                                  )
                                                  .state =
                                              acct;

                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              if (selectedFromAccount != null) ...[
                                SizedBox(height: screenHeight * 0.01),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.03,
                                  ),
                                  child: Text(
                                    selectedFromAccount['balance'] ?? '',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.030,
                                      fontWeight: FontWeight.w600,
                                      color: DefaultColors.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.03),
                              ] else ...[
                                SizedBox(height: screenHeight * 0.02),
                              ],

                              CustomInputField(
                                label: 'Transfer Type',
                                value: ref.watch(transferTypeProvider) != null
                                    ? ref.watch(transferTypeProvider) ==
                                              'individual'
                                          ? 'Individual'
                                          : 'Corporate'
                                    : '',
                                controller:
                                    ref.watch(transferTypeProvider) != null
                                    ? TextEditingController(
                                        text:
                                            ref.watch(transferTypeProvider) ==
                                                'individual'
                                            ? 'Individual'
                                            : 'Corporate',
                                      )
                                    : null,
                                showDropdown: true,
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    builder: (context) => FawranTypeSheet(),
                                  ).then((selectedType) {
                                    if (selectedType != null) {
                                      ref
                                          .read(transferTypeProvider.notifier)
                                          .setTransferType(selectedType);
                                    }
                                  });
                                },
                              ),

                              // Show Divider and BeneficiaryAliasSelector only after transfer type is selected
                              if (ref.watch(transferTypeProvider) != null) ...[
                                SizedBox(height: screenHeight * 0.02),
                                Divider(color: DefaultColors.grayE5),
                                SizedBox(height: screenHeight * 0.02),
                                BeneficiaryAliasSelector(),
                                SizedBox(height: screenHeight * 0.02),

                                // Show "Select Beneficiary Alias" field only when "Existing" is selected
                                if (ref.watch(beneficiaryAliasTypeProvider) ==
                                    0)
                                  CustomInputField(
                                    label: 'Select Beneficiary Alias',
                                    controller: TextEditingController(
                                      text:
                                          ref.watch(
                                            selectedBeneficiaryAliasProvider,
                                          ) ??
                                          '',
                                    ),
                                    showDropdown: true,
                                    onTap: () {
                                      // For now, simulate selection - replace with actual bottom sheet
                                      ref
                                              .read(
                                                selectedBeneficiaryAliasProvider
                                                    .notifier,
                                              )
                                              .state =
                                          "Sample Beneficiary"; // Replace with actual selection
                                      // showModalBottomSheet(
                                      //   context: context,
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(20),
                                      //   ),
                                      //   builder: (context) => FawranAliasTypeSheet(),
                                      // ).then((selectedType) {
                                      //   // Handle the selected type here
                                      // });
                                    },
                                  ),

                                // Show these fields only when "New" is selected
                                if (ref.watch(beneficiaryAliasTypeProvider) ==
                                    1) ...[
                                  CustomInputField(
                                    label: 'Beneficiary Alias Type',
                                    controller: TextEditingController(
                                      text:
                                          ref.watch(
                                            selectedBeneficiaryAliasTypeProvider,
                                          ) ??
                                          '',
                                    ),
                                    showDropdown: true,
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        builder: (context) =>
                                            FawranAliasTypeSheet(),
                                      ).then((selectedType) {
                                        if (selectedType != null) {
                                          ref
                                                  .read(
                                                    selectedBeneficiaryAliasTypeProvider
                                                        .notifier,
                                                  )
                                                  .state =
                                              selectedType;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  CustomInputField(
                                    label: 'Enter CR Number',
                                    value: ref.watch(crProvider).crNumber,
                                    onChanged: (val) => ref
                                        .read(crProvider.notifier)
                                        .setCrNumber(val),
                                    showDropdown: false,
                                    inputType: TextInputType.number,
                                  ),

                                  // Show verified beneficiary details after successful CR verification
                                  if (ref.watch(crProvider).verified) ...[
                                    SizedBox(height: screenHeight * 0.02),
                                    CustomInputField(
                                      label: 'Beneficiary Name',
                                      value:
                                          ref
                                              .watch(crProvider)
                                              .beneficiaryName ??
                                          '',
                                      showDropdown: false,
                                      isReadOnly: true,
                                      isVerified: true,
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    CustomInputField(
                                      label: 'Bank Name',
                                      value:
                                          ref.watch(crProvider).bankName ?? '',
                                      showDropdown: false,
                                      isReadOnly: true,
                                      isVerified: true,
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    SaveAliasWidget(
                                      isChecked: isChecked,
                                      onTap: () {
                                        ref
                                                .read(
                                                  saveAliasProvider.notifier,
                                                )
                                                .state =
                                            !isChecked;
                                      },
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    CustomInputField(
                                      label: 'Give a nick Name',
                                      showDropdown: false,
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    Divider(color: DefaultColors.grayE5),
                                    SizedBox(height: screenHeight * 0.02),
                                    AmountFiled(controller: amountController),
                                    SizedBox(height: screenHeight * 0.008),
                                    LimitInfoTile(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(22),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          builder: (_) => LimitsBottomSheet(),
                                        );
                                      },
                                    ),

                                    SizedBox(height: screenHeight * 0.032),
                                    PurposeOfTransfer(
                                      labeltext: 'Purpose of Transfer',
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(22),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          builder: (_) => UniversalPurposeSheet(
                                            isSubPurpose: false,
                                            onPurposeSelected: (purpose) {
                                              ref
                                                      .read(
                                                        selectedPurposeProvider
                                                            .notifier,
                                                      )
                                                      .state =
                                                  purpose;
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    Consumer(
                                      builder: (context, ref, _) {
                                        final selectedPurpose = ref.watch(
                                          selectedPurposeProvider,
                                        );

                                        if (selectedPurpose == null)
                                          return SizedBox.shrink();

                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: screenHeight * 0.032,
                                            ),

                                            SubPurpose(
                                              labeltext:
                                                  'Sub purpose of Transfer',
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                          top: Radius.circular(
                                                            22,
                                                          ),
                                                        ),
                                                  ),
                                                  isScrollControlled: true,
                                                  builder: (_) => UniversalPurposeSheet(
                                                    isSubPurpose: true,
                                                    onSubPurposeSelected:
                                                        (subPurpose) {
                                                          ref
                                                                  .read(
                                                                    selectedSubPurposeProvider
                                                                        .notifier,
                                                                  )
                                                                  .state =
                                                              subPurpose;
                                                        },
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    RemarksField(controller: remarksController),
                                    SizedBox(
                                      height: ref.watch(amountProvider).isEmpty
                                          ? screenHeight * 0.075
                                          : screenHeight * 0.02,
                                    ),
                                    Consumer(
                                      builder: (context, ref, _) {
                                        final amount = ref.watch(
                                          amountProvider,
                                        );

                                        if (amount.isEmpty)
                                          return SizedBox.shrink();

                                        // Convert amount to double safely
                                        final amt =
                                            double.tryParse(amount) ?? 0.0;

                                        final fee =
                                            4.00; // fixed or dynamic later
                                        final total = amt + fee;

                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: screenHeight * 0.02,
                                            ),

                                            // FIRST BOX: FEES
                                            Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 18,
                                              ),
                                              decoration: BoxDecoration(
                                                color: DefaultColors.lightblue1,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Fees",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DefaultColors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${fee.toStringAsFixed(2)} QAR",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.040,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenHeight * 0.035,
                                                  ),
                                                  Text(
                                                    "Total Amount",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          DefaultColors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${total.toStringAsFixed(2)} QAR",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.040,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          DefaultColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ],

                                // Show these fields when "Existing" is selected AND a beneficiary is chosen
                                if (ref.watch(beneficiaryAliasTypeProvider) ==
                                        0 &&
                                    ref.watch(
                                          selectedBeneficiaryAliasProvider,
                                        ) !=
                                        null) ...[
                                  SizedBox(height: screenHeight * 0.02),
                                  AmountFiled(controller: amountController),
                                  SizedBox(height: screenHeight * 0.008),
                                  LimitInfoTile(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(22),
                                          ),
                                        ),
                                        isScrollControlled: true,
                                        builder: (_) => LimitsBottomSheet(),
                                      );
                                    },
                                  ),

                                  SizedBox(height: screenHeight * 0.032),
                                  PurposeOfTransfer(
                                    labeltext: 'Purpose of Transfer',
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(22),
                                          ),
                                        ),
                                        isScrollControlled: true,
                                        builder: (_) => UniversalPurposeSheet(
                                          isSubPurpose: false,
                                          onPurposeSelected: (purpose) {
                                            ref
                                                    .read(
                                                      selectedPurposeProvider
                                                          .notifier,
                                                    )
                                                    .state =
                                                purpose;
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  Consumer(
                                    builder: (context, ref, _) {
                                      final selectedPurpose = ref.watch(
                                        selectedPurposeProvider,
                                      );

                                      if (selectedPurpose == null)
                                        return SizedBox.shrink();

                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: screenHeight * 0.032,
                                          ),

                                          SubPurpose(
                                            labeltext:
                                                'Sub purpose of Transfer',
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          22,
                                                        ),
                                                      ),
                                                ),
                                                isScrollControlled: true,
                                                builder: (_) => UniversalPurposeSheet(
                                                  isSubPurpose: true,
                                                  onSubPurposeSelected:
                                                      (subPurpose) {
                                                        ref
                                                                .read(
                                                                  selectedSubPurposeProvider
                                                                      .notifier,
                                                                )
                                                                .state =
                                                            subPurpose;
                                                      },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  RemarksField(controller: remarksController),
                                  SizedBox(
                                    height: ref.watch(amountProvider).isEmpty
                                        ? screenHeight * 0.075
                                        : screenHeight * 0.02,
                                  ),
                                  Consumer(
                                    builder: (context, ref, _) {
                                      final amount = ref.watch(amountProvider);

                                      if (amount.isEmpty)
                                        return SizedBox.shrink();

                                      // Convert amount to double safely
                                      final amt =
                                          double.tryParse(amount) ?? 0.0;

                                      final fee =
                                          4.00; // fixed or dynamic later
                                      final total = amt + fee;

                                      return Column(
                                        children: [
                                          SizedBox(height: screenHeight * 0.02),

                                          // FIRST BOX: FEES
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 18,
                                            ),
                                            decoration: BoxDecoration(
                                              color: DefaultColors.lightblue1,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Fees",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    fontWeight: FontWeight.w400,
                                                    color: DefaultColors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "${fee.toStringAsFixed(2)} QAR",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.035,
                                                ),
                                                Text(
                                                  "Total Amount",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    fontWeight: FontWeight.w400,
                                                    color: DefaultColors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "${total.toStringAsFixed(2)} QAR",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.040,
                                                    fontWeight: FontWeight.w700,
                                                    color: DefaultColors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],

                                // ---- VERIFIED OUTPUT ----
                              ] else ...[
                                SizedBox(height: screenHeight * 0.02),
                                // Show Select Beneficiary Alias field when transfer type is not selected
                                CustomInputField(
                                  label: 'Select Beneficiary Alias',
                                  showDropdown: true,
                                  onTap: () {
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //   ),
                                    //   builder: (context) => FawranAliasTypeSheet(),
                                    // ).then((selectedType) {
                                    //   // Handle the selected type here
                                    // });
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Fixed Verify button (only for New when not yet verified)
                    if (ref.watch(transferTypeProvider) != null &&
                        ref.watch(beneficiaryAliasTypeProvider) == 1 &&
                        !ref.watch(crProvider).verified)
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.040),
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(crProvider.notifier).verify();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF004AAD),
                            minimumSize: Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Verify",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    // Fixed bottom section - InfoText, Terms and Proceed Button (only for verified New)
                    if (ref.watch(transferTypeProvider) != null &&
                        ref.watch(beneficiaryAliasTypeProvider) == 1 &&
                        ref.watch(crProvider).verified)
                      Container(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.040,
                          right: screenWidth * 0.040,
                          bottom: screenHeight * 0.02,
                        ),
                        child: Column(
                          children: [
                            InfoText(),
                            SizedBox(height: screenHeight * 0.02),
                            TermsAndConditionsCheckbox(),
                            SizedBox(height: screenHeight * 0.02),
                            ElevatedButton(
                              onPressed: () {
                                // Proceed action for Existing or New (verified)
                                final amount = ref.read(amountProvider);
                                final fees = 4.00;
                                final total =
                                    (double.tryParse(amount) ?? 0.0) + fees;

                                final transferData = {
                                  "fromAccount":
                                      "Current Account - ****1234", // Replace with actual account
                                  "reference":
                                      "REF${DateTime.now().millisecondsSinceEpoch}",
                                  "beneficiaryAliasType":
                                      ref.read(transferTypeProvider) ==
                                          'individual'
                                      ? 'Individual'
                                      : 'Corporate',
                                  "beneficiaryAlias":
                                      ref.read(beneficiaryAliasTypeProvider) ==
                                          0
                                      ? "Selected Alias" // Replace with actual selected alias
                                      : (ref.read(crProvider).crNumber),
                                  "beneficiaryFullName":
                                      ref.read(beneficiaryAliasTypeProvider) ==
                                          0
                                      ? "Existing Beneficiary Name" // Replace with actual name
                                      : (ref.read(crProvider).beneficiaryName ??
                                            ""),
                                  "beneficiaryBankName":
                                      ref.read(beneficiaryAliasTypeProvider) ==
                                          0
                                      ? "Existing Bank Name" // Replace with actual bank
                                      : (ref.read(crProvider).bankName ?? ""),
                                  "amount": amount,
                                  "purposeofTransfer":
                                      ref.read(
                                        selectedPurposeProvider,
                                      )?['title'] ??
                                      "",
                                  "subPurposeofTransfer":
                                      ref.read(selectedSubPurposeProvider) ??
                                      "",
                                  "totaldebitAmount": total.toStringAsFixed(2),
                                  "remarks": ref
                                      .read(remarksControllerProvider)
                                      .text,
                                  "fees": fees.toStringAsFixed(2),
                                };

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConfirmPage(
                                      transferDataOfWithinFawran: transferData,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade400,
                                minimumSize: Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Proceed",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Proceed button for "Existing" flow (without InfoText and Terms)
                    if (ref.watch(transferTypeProvider) != null &&
                        ref.watch(beneficiaryAliasTypeProvider) == 0)
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.040),
                        child: ElevatedButton(
                          onPressed: () {
                            // Proceed action for Existing
                            final amount = ref.read(amountProvider);
                            final fees = 4.00;
                            final total =
                                (double.tryParse(amount) ?? 0.0) + fees;

                            final transferData = {
                              "fromAccount": "Current Account - ****1234",
                              "reference":
                                  "REF${DateTime.now().millisecondsSinceEpoch}",
                              "beneficiaryAliasType":
                                  ref.read(transferTypeProvider) == 'individual'
                                  ? 'Individual'
                                  : 'Corporate',
                              "beneficiaryAlias": "Selected Alias",
                              "beneficiaryFullName":
                                  "Existing Beneficiary Name",
                              "beneficiaryBankName": "Existing Bank Name",
                              "amount": amount,
                              "purposeofTransfer":
                                  ref.read(selectedPurposeProvider)?['title'] ??
                                  "",
                              "subPurposeofTransfer":
                                  ref.read(selectedSubPurposeProvider) ?? "",
                              "totaldebitAmount": total.toStringAsFixed(2),
                              "remarks": ref
                                  .read(remarksControllerProvider)
                                  .text,
                              "fees": fees.toStringAsFixed(2),
                            };

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmPage(
                                  transferDataOfWithinFawran: transferData,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Proceed",
                            style: TextStyle(color: Colors.white),
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
    );
  }
}
