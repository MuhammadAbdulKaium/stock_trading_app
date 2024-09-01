import 'package:get/get.dart';
import 'package:stock_trading_app/models/bank_details_model.dart';

class BankingController extends GetxController {
  final RxBool isAnyFieldChanged = false.obs;
  final bankName = ''.obs;
  final branchName = ''.obs;
  final accountHolderName = ''.obs;
  final accountNumber = ''.obs;
  final routingNumber = ''.obs;
  var personalDetails = BankDetailsModel().obs;

  bool validateBankName(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");   // Define a regular expression for valid name characters (e.g., letters, spaces, and common punctuation)

    if (value.isEmpty) {
      return false;
    } else if (!validNameRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  void updateBankName(String input) {
    if (validateBankName(input)) {
      bankName.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  bool validateBranchName(String value) {
    value = value.trim(); // Trim input to remove leading or trailing whitespace
    final validBranchNameRegex = RegExp(r"^[a-zA-Z0-9\s\.\-']+$"); // Define regular expression for valid branch name characters (letters, numbers, spaces, dots, hyphens, and apostrophes)

    if (value.isEmpty) {
      return false;
    } else if (!validBranchNameRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  void updateBranchName(String input) {
    if (validateBranchName(input)) {
      branchName.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  bool validateAccountHolderName(String value) {
    value = value.trim(); // Trim input to remove leading or trailing whitespace
    final validAccountHolderNameRegex = RegExp(r"^[a-zA-Z\s\.\-']+$"); // Regular expression for valid account holder name characters (letters, spaces, periods, hyphens, and apostrophes)

    if (value.isEmpty) {
      return false;
    } else if (!validAccountHolderNameRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  void updateAccountHolderName(String input) {
    if (validateAccountHolderName(input)) {
      accountHolderName.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  bool validateAccountNumber(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validAccountNumberRegex = RegExp(r'^\d{1,17}$');   // Define a regular expression for numbers with up to 17 digits

    if (value.isEmpty) {
      return false;
    } else if (!validAccountNumberRegex.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }
  void updateAccountNumber(String input) {
    if (validateAccountNumber(input)) {
      accountNumber.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  bool validateRoutingNumber(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validRoutingNumberRegex = RegExp(r'^\d{9}$');   // Define a regular expression for numbers with up to 17 digits

    if (value.isEmpty) {
      return false;
    } else if (!validRoutingNumberRegex.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }
  void updateRoutingNumber(String input) {
    if (validateRoutingNumber(input)) {
      routingNumber.value = input.trim();
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  Future<void> loadBankingDetails() async {
    try {
      personalDetails.value = BankDetailsModel(
        id: '1',
        bankName: 'Dutch Bangla Bank',
        branchName: 'Rangpur Branch',
        accountName: 'Stock House LTD',
        accountNumber: '03597561512145152152',
        routingNumber: '23546878984',
      );

      bankName.value = personalDetails.value.bankName ?? '';
      branchName.value = personalDetails.value.branchName ?? '';
      accountHolderName.value = personalDetails.value.accountName ?? '';
      accountNumber.value = personalDetails.value.accountNumber ?? '';
      routingNumber.value = personalDetails.value.routingNumber ?? '';

    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
}