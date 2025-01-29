import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/banking_api.dart';
import 'package:stock_trading_app/api/my_investments_api.dart';
import 'package:stock_trading_app/common/common_error_dialog.dart';
import 'package:stock_trading_app/mobile/cash_out/bank_details_incomplete_dialog.dart';
import 'package:stock_trading_app/models/bank_details_model.dart';
import 'package:stock_trading_app/models/my_investment_model.dart';

class CashOutController extends GetxController {
  var isLoading = false.obs;
  final withdrawableBalance = 0.0.obs;
  final enterAmount = TextEditingController().obs;
  var rawAmount = 0.0.obs;
  final bankName = ''.obs;
  final branchName = ''.obs;
  final accountHolderName = ''.obs;
  final accountNumber = ''.obs;
  final routingNumber = ''.obs;
  final myInvestment = MyInvestmentModel().obs;
  var bankDetails = BankDetailsModel().obs;

  void updateEnterAmount(String value) {
    if (value.isEmpty) {
      enterAmount.value.text = '';
    } else {
      // Get the current cursor position before formatting
      final oldText = enterAmount.value.text;
      final oldSelection = enterAmount.value.selection;

      // Remove all non-numeric characters except the decimal point
      final input = value.replaceAll(RegExp(r'[^\d.]'), '');
      final parts = input.split('.');

      // Handling integer part (before the decimal)
      String integerPart = parts[0];  // No need to format with commas

      // Allow decimals if the user includes a decimal point
      String decimalPart = '';
      if (parts.length > 1) {
        decimalPart = parts[1].substring(0, parts[1].length <= 2 ? parts[1].length : 2); // Allow max 2 digits after decimal
      }

      // Recombine the integer and decimal parts
      String formattedValue = '৳$integerPart';
      
      // Check if the input contains a decimal point
      if (value.contains('.')) {
        formattedValue += '.$decimalPart';
      }

      // Convert to double for internal API calls
      rawAmount.value = (num.tryParse(input) ?? 0.0).toDouble();

      // Set the formatted text
      enterAmount.value.text = formattedValue;

      // Calculate the new cursor position
      final newTextLength = formattedValue.length;
      final oldTextLength = oldText.length;
      final selectionIndex = oldSelection.baseOffset + (newTextLength - oldTextLength);

      // Set the new selection based on the old position and adjustment
      enterAmount.value.selection = TextSelection.fromPosition(
        TextPosition(offset: selectionIndex.clamp(0, newTextLength)),  // Ensure the new position is within bounds
      );
    }
  }

  double getEnteredAmount() {
    return rawAmount.value;
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
      bankName.value = input.trim();
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

  var token = ''.obs;
  late SharedPreferences prefs;
  Future<void> initializeToken() async {
    prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  final MyInvestmentsApi _myInvestmentsApi = MyInvestmentsApi();
  final BankingApi _bankingApi = BankingApi();
  Future<void> loadCashOut() async {
    isLoading(true);
    try {
      Get.toNamed("/cash_out");

      final response = await _myInvestmentsApi.getMyInvestments(token.value);
      if (response.statusCode == 200) {
        myInvestment.value = MyInvestmentModel.fromJson(response.data);
        withdrawableBalance.value = myInvestment.value.readyForCashout ?? 0.0;
      } else {
        Get.dialog(const CommonErrorDialog(title: 'Something went wrong please try again later.', message: ''));
      }

      BankDetailsModel? data = await _bankingApi.getBankData(token.value);
      if (data != null) {
        bankDetails.value = data;

        if (bankDetails.value.bankName != null &&
        bankDetails.value.branchName != null &&
        bankDetails.value.accountHolderName != null &&
        bankDetails.value.accountNumber != null &&
        bankDetails.value.routingNumber != null) {
          bankName.value = bankDetails.value.bankName ?? '';
          branchName.value = bankDetails.value.branchName ?? '';
          accountHolderName.value = bankDetails.value.accountHolderName ?? '';
          accountNumber.value = bankDetails.value.accountNumber ?? '';
          routingNumber.value = bankDetails.value.routingNumber ?? '';
        } else {
          Get.dialog(const BankDetailsIncompleteDialog());
        }
      } else {
        Get.dialog(const BankDetailsIncompleteDialog());
      }
    } catch (e) {
      Get.dialog(const CommonErrorDialog(title: 'Something went wrong please try again later.', message: ''));
    } finally {
      isLoading(false);
    }
  }

  void resetVariables() {
    enterAmount.value.text = '';
    rawAmount = 0.0.obs;
    withdrawableBalance.value = 0.0;
  }

  @override
  void onInit() async {
    super.onInit();
    await initializeToken();
  }

  @override
  void onClose() {
    enterAmount.value.dispose();
    super.onClose();
  }
}