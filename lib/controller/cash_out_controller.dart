import 'package:get/get.dart';

class CashOutController extends GetxController {
  var isLoading = false.obs;
  final withdrawableBalance = 200.obs;
  final enterAmount = ''.obs;
  final bankName = ''.obs;
  final branchName = ''.obs;
  final accountHolderName = ''.obs;
  final accountNumber = ''.obs;
  final routingNumber = ''.obs;

  bool validateAmount(String value) {
    final regex = RegExp(r'^\d*\.?\d*$');   // Regular expression to match numbers with at most one decimal point
    final amount = value.trim().isNotEmpty ? num.tryParse(value) : 0;           // Check if value is a valid number (either int or double)

    if (value.trim().isEmpty) {
      return false;
    } else if (amount == null || amount < 0) {
      return false;
    } else if (!regex.hasMatch(value.trim())) {
      return false;
    } else if (withdrawableBalance < amount) {
      return false;
    }

    return true;
  }

  void updateEnterAmount(String input) {
    if (validateAmount(input)) {
      enterAmount.value = input.trim();
    }
  }

  bool validateName(String value) {
    value = value.trim();      // Trim the input to remove any leading or trailing whitespace
    final validBankNameRegex = RegExp(r"^[a-zA-Z\s\.\,\-'’]+$");   // Define a regular expression for valid bank name characters (e.g., letters, spaces, and common punctuation)

    if (value.isEmpty) {
      return false;
    } else if (!validBankNameRegex.hasMatch(value)) {
      return false;
    }

    return true;
  }

  void updateBankName(String input) {
    if (validateName(input)) {
      enterAmount.value = input.trim();
    }
  }

  void updateBranchName(String input) {
    if (validateName(input)) {
      branchName.value = input.trim();
    }
  }

  void updateAccountHolderName(String input) {
    if (validateName(input)) {
      accountHolderName.value = input.trim();
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
  }
}