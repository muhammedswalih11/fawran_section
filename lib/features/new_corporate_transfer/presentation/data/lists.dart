import 'models.dart';

final List<AliasModel> aliasList = [
  AliasModel(
    idNumber: "URJNV1801840193018391",
    account: "Savings Account xxxx2088",
    iban: "IBAN",
    iconSvg: "assets/images/Cheque Book.svg",
  ),
  AliasModel(
    idNumber: "ABCD1234567890",
    account: "Current Account xxxx5521",
    iban: "IBAN",
    iconSvg: "assets/images/Cheque Book.svg",
  ),
  AliasModel(
    idNumber: "ABCD1234567890",
    account: "Current Account xxxx5521",
    iban: "IBAN",
    iconSvg: "assets/images/Cheque Book.svg",
  ),
  AliasModel(
    idNumber: "ABCD1234567890",
    account: "Current Account xxxx5521",
    iban: "IBAN",
    iconSvg: "assets/images/Cheque Book.svg",
  ),
];

final List<Beneficiary> beneficiaryList = [
  Beneficiary(
    name: "Sara Rahman",
    id: "XXXXXX2029",
    bank: "Attijari Bank",
    localImage: "assets/images/sara.png",
    isFavourite: true,
  ),
  Beneficiary(name: "Aliya Khan", id: "XXXX1827", bank: "Dukhan Bank (QA)"),
  Beneficiary(
    name: "Sangita Raman",
    id: "XXXX8817",
    bank: "Attijari Bank",
    isFavourite: true,
  ),

  Beneficiary(
    name: "ABC Ltd.",
    id: "AT7392094732847928479829",
    bank: "Doha Bank",
    isCorporate: true,
  ),

  Beneficiary(
    name: "Rami Jaber",
    id: "44920237",
    bank: "Masaraf Al Rayan",
    isCorporate: true,
  ),
];

// this is for request money list

final List<RequestItem> receivedRequests = [
  RequestItem(
    name: "Adil",
    alias: "alias_001",
    amount: "- 831,840,184.00 QAR",
    status: "Pending",
    timeLeft: "2 hrs Left",

    isReceived: true, // 👈 arrow down
  ),
  RequestItem(
    name: "Sofia",
    alias: "sofia_001",
    amount: "- 2,384.00 QAR",
    status: "Pending",
    timeLeft: "2 hrs Left",

    isReceived: true,
  ),
  RequestItem(
    name: "Ahmed",
    alias: "alias_009",
    amount: "- 1,200.00 QAR",
    status: "Pending",
    timeLeft: "3 hrs Left",

    isReceived: true,
  ),
];

/// SENT LIST (use same model later)
final List<RequestItem> sentRequests = [
  RequestItem(
    name: "Maya",
    alias: "maya_002",
    amount: "+ 400.00 QAR",
    status: "Completed",
    timeLeft: "",

    isReceived: false, // 👈 arrow up
  ),
];

// recent transactions list

final List<RecentTransaction> recentTransactions = [
  RecentTransaction(
    name: "Aasmah Jai",
    dateLabel: "Today",
    amount: "23,298.00 QAR",
    avatar: "assets/images/sara.png",
  ),
  RecentTransaction(
    name: "Bismillah Ali",
    dateLabel: "Yesterday",
    amount: "7,32832.00 QAR",
  ),
  RecentTransaction(
    name: "Nadia Qureshi",
    dateLabel: "07 Nov",
    amount: "298.00 QAR",
  ),
  RecentTransaction(
    name: "Sarah Ahmed",
    dateLabel: "06 Nov",
    amount: "473.00 QAR",
    avatar: "assets/images/sara.png",
  ),
  RecentTransaction(
    name: "Yusuf Basha",
    dateLabel: "05 Nov",
    amount: "7,232.00 QAR",
  ),
];

//favourite  list

final List<FavouriteItem> favouriteList = [
  FavouriteItem(name: "Peter P", avatar: "assets/images/sarah.png"),
  FavouriteItem(name: "ABC Lt..", isCorporate: true),
  FavouriteItem(name: "Sarah", avatar: "assets/images/sarah.png"),
  FavouriteItem(name: "Sahil"),
];

//dummy crlist

final crDummyData = <CrDetails>[
  CrDetails(
    crNumber: "12345",
    beneficiaryName: "ABC Pvt. Ltd.",
    bankName: "Doha Bank",
  ),
  CrDetails(
    crNumber: "123456",
    beneficiaryName: "Beta Holdings",
    bankName: "Commercial Bank",
  ),
  CrDetails(
    crNumber: "1234567",
    beneficiaryName: "Qatar Logistics",
    bankName: "QIB",
  ),
];
