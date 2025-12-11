import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/lists.dart';
import '../data/models.dart';

// State notifier for managing beneficiary list
class BeneficiaryListNotifier extends StateNotifier<List<Beneficiary>> {
  BeneficiaryListNotifier() : super(beneficiaryList);

  void toggleFavourite(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Beneficiary(
            name: state[i].name,
            id: state[i].id,
            bank: state[i].bank,
            avatarUrl: state[i].avatarUrl,
            localImage: state[i].localImage,
            isFavourite: !(state[i].isFavourite ?? false),
            isDisabled: state[i].isDisabled,
            statusText: state[i].statusText,
            isCorporate: state[i].isCorporate,
          )
        else
          state[i],
    ];
  }
}

// Provider for beneficiary list
final beneficiaryListProvider =
    StateNotifierProvider<BeneficiaryListNotifier, List<Beneficiary>>((ref) {
      return BeneficiaryListNotifier();
    });

class CrState {
  final String crNumber;
  final String? beneficiaryName;
  final String? bankName;
  final bool verified;

  CrState({
    this.crNumber = "",
    this.beneficiaryName,
    this.bankName,
    this.verified = false,
  });

  CrState copyWith({
    String? crNumber,
    String? beneficiaryName,
    String? bankName,
    bool? verified,
  }) {
    return CrState(
      crNumber: crNumber ?? this.crNumber,
      beneficiaryName: beneficiaryName ?? this.beneficiaryName,
      bankName: bankName ?? this.bankName,
      verified: verified ?? this.verified,
    );
  }
}

class CrNotifier extends StateNotifier<CrState> {
  CrNotifier() : super(CrState());

  void setCrNumber(String value) {
    state = state.copyWith(crNumber: value);
  }

  void verify() {
    final cr = state.crNumber.trim();

    final matched = crDummyData.firstWhere(
      (e) => e.crNumber == cr,
      orElse: () => CrDetails(crNumber: "", beneficiaryName: "", bankName: ""),
    );

    if (matched.crNumber.isEmpty) {
      // Not found
      state = state.copyWith(
        verified: false,
        beneficiaryName: null,
        bankName: null,
      );
    } else {
      state = state.copyWith(
        verified: true,
        beneficiaryName: matched.beneficiaryName,
        bankName: matched.bankName,
      );
    }
  }
}

final crProvider = StateNotifierProvider<CrNotifier, CrState>(
  (ref) => CrNotifier(),
);

// Transfer Type State and Notifier
class TransferTypeNotifier extends StateNotifier<String?> {
  TransferTypeNotifier() : super(null);

  void setTransferType(String type) {
    state = type;
  }

  void clear() {
    state = null;
  }
}

// Provider for transfer type
final transferTypeProvider =
    StateNotifierProvider<TransferTypeNotifier, String?>((ref) {
      return TransferTypeNotifier();
    });

// Beneficiary Alias Type Notifier (Existing or New)
class BeneficiaryAliasTypeNotifier extends StateNotifier<int> {
  final Ref ref;

  BeneficiaryAliasTypeNotifier(this.ref) : super(0); // 0 = Existing, 1 = New

  void setType(int type) {
    state = type;

    // When "New" is selected and transfer type is "corporate", change it to "individual"
    if (type == 1) {
      final currentTransferType = ref.read(transferTypeProvider);
      if (currentTransferType == 'corporate') {
        ref.read(transferTypeProvider.notifier).setTransferType('individual');
      }
    }
  }

  bool get isExisting => state == 0;
  bool get isNew => state == 1;
}

// Provider for beneficiary alias type
final beneficiaryAliasTypeProvider =
    StateNotifierProvider<BeneficiaryAliasTypeNotifier, int>((ref) {
      return BeneficiaryAliasTypeNotifier(ref);
    });

final saveAliasProvider = StateProvider<bool>((ref) => false);

final selectedCurrencyCodeProvider = StateProvider<String>((ref) => "QAR");

final selectedCurrencyIconProvider = StateProvider<String>(
  (ref) => "assets/images/qatar.svg",
);

final tempCurrencySelectionProvider = StateProvider<String?>((ref) => null);

final amountProvider = StateProvider<String>((ref) => "");

final amountControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final selectedPurposeProvider = StateProvider<Map<String, String>?>(
  (ref) => null,
);

final selectedSubPurposeProvider = StateProvider<String?>((ref) => null);

final remarksControllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final termsAcceptedProvider = StateProvider<bool>((ref) => false);

final selectedBeneficiaryAliasTypeProvider = StateProvider<String?>(
  (ref) => null,
);

final selectedBeneficiaryAliasProvider = StateProvider<String?>((ref) => null);

final selectedFromAccountProvider = StateProvider<Map<String, String>?>(
  (ref) => null,
);
