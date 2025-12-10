import 'package:fawran/features/new_corporate_transfer/presentation/data/lists.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/alias_accounts_section.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/alias_cards.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/favourite_section.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/recent_transaction_tile.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/request_section.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/section_header.dart';
import 'package:fawran/features/new_corporate_transfer/presentation/widgets/transfer_money_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/providers.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/beneficiary_tile.dart';

class FawranLandingPage extends ConsumerWidget {
  const FawranLandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

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
                  'Within Own Account',
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
              child: SingleChildScrollView(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.050,

                    bottom: screenHeight * 0.045,
                  ),
                  decoration: BoxDecoration(
                    color: DefaultColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(title: "Your Aliases", onViewAll: () {}),
                      SizedBox(height: screenHeight * 0.003),
                      AliasAccountsSection(),
                      SizedBox(height: screenHeight * 0.01),
                      SectionHeader(
                        title: 'Fawran Favourites',
                        onViewAll: () {},
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          left: screenHeight * 0.015,
                          right: screenHeight * 0.015,
                        ),
                        child: Favourites(),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          left: screenHeight * 0.015,
                          right: screenHeight * 0.015,
                        ),
                        child: TransferMoneyCard(),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      SectionHeader(
                        title: 'Fawran Beneficiaries',
                        onViewAll: () {},
                        showAdd: true,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: DefaultColors.graylight),
                        ),
                        margin: EdgeInsets.only(
                          top: screenHeight * 0.015,
                          left: screenHeight * 0.015,
                          right: screenHeight * 0.015,
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          itemBuilder: (context, index) {
                            final beneficiaries = ref.watch(
                              beneficiaryListProvider,
                            );
                            final b = beneficiaries[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: screenHeight * 0.015,
                                right: screenHeight * 0.015,
                                top: screenHeight * 0.008,
                                bottom: screenHeight * 0.008,
                              ),
                              child: BeneficiaryTile(
                                beneficiary: b,
                                onToggleFavourite: () {
                                  ref
                                      .read(beneficiaryListProvider.notifier)
                                      .toggleFavourite(index);
                                },
                                showActionButton: true,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 1,
                              thickness: 1,
                              color: DefaultColors.grayE6,
                            );
                          },
                          itemCount: ref.watch(beneficiaryListProvider).length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SectionHeader(
                        title: 'Requests',
                        onViewAll: () {},
                        showAdd: true,
                      ),
                      RequestSection(),
                      SizedBox(height: screenHeight * 0.02),
                      SectionHeader(title: 'Recent fawrans', onViewAll: () {}),
                      SizedBox(height: screenHeight * 0.015),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: DefaultColors.graylight),
                        ),
                        margin: EdgeInsets.only(
                          top: screenHeight * 0.015,
                          left: screenHeight * 0.015,
                          right: screenHeight * 0.015,
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: screenHeight * 0.015,
                                right: screenHeight * 0.015,
                                top: screenHeight * 0.008,
                                bottom: screenHeight * 0.008,
                              ),
                              child: RecentTransactionTile(
                                tx: recentTransactions[index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 1,
                              thickness: 1,
                              color: DefaultColors.grayE6,
                            );
                          },
                          itemCount: beneficiaryList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
