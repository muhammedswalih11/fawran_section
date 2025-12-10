import 'package:flutter/material.dart';

import '../data/lists.dart';
import 'alias_cards.dart';

class AliasAccountsSection extends StatelessWidget {
  const AliasAccountsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: aliasList.length,
        itemBuilder: (context, index) {
          final item = aliasList[index];
          return AliasCard(
            idNumber: item.idNumber,
            account: item.account,
            iban: item.iban,
            iconSvg: item.iconSvg,
            onMoreOptions: () {},
          );
        },
      ),
    );
  }
}
