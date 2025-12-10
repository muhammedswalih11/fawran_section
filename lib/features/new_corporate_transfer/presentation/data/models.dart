class AliasModel {
  final String idNumber;
  final String account;
  final String iban;
  final String iconSvg;

  AliasModel({
    required this.idNumber,
    required this.account,
    required this.iban,
    required this.iconSvg,
  });
}

// Beneficairy List model

class Beneficiary {
  final String name;
  final String id;
  final String bank;
  final String? avatarUrl; // optional network image
  final String? localImage; // optional local asset image path
  final bool? isFavourite;
  final bool isDisabled;
  final String? statusText;
  final bool isCorporate;

  const Beneficiary({
    required this.name,
    required this.id,
    required this.bank,
    this.avatarUrl,
    this.localImage,
    this.isFavourite = false,
    this.isDisabled = false,
    this.statusText,
    this.isCorporate = false,
  });
}

class RequestItem {
  final String name;
  final String alias;
  final String amount;
  final String status;
  final String timeLeft;
  final bool isReceived; // 👈 true = arrow down, false = arrow up

  const RequestItem({
    required this.name,
    required this.alias,
    required this.amount,
    required this.status,
    required this.timeLeft,
    required this.isReceived,
  });
}

// model for reccent transations

class RecentTransaction {
  final String name;
  final String dateLabel; // "Today", "Yesterday", "07 Nov"
  final String amount;
  final String? avatar; // optional asset

  const RecentTransaction({
    required this.name,
    required this.dateLabel,
    required this.amount,
    this.avatar,
  });
}

class FavouriteItem {
  final String name;
  final String? avatar; // image path
  final bool isCorporate;

  const FavouriteItem({
    required this.name,
    this.avatar,
    this.isCorporate = false,
  });
}

// dummmy class for cr number aliases

class CrDetails {
  final String crNumber;
  final String beneficiaryName;
  final String bankName;

  const CrDetails({
    required this.crNumber,
    required this.beneficiaryName,
    required this.bankName,
  });
}
