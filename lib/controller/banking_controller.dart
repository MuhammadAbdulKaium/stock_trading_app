import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_trading_app/api/banking_api.dart';
import 'package:stock_trading_app/controller/landing_page_controller.dart';
import 'package:stock_trading_app/models/bank_details_model.dart';

class BankingController extends GetxController {
  final LandingPageController landingPageController = Get.find<LandingPageController>();
  final RxBool isAnyFieldChanged = false.obs;
  final bankNameController = TextEditingController().obs;
  final branchNameController = TextEditingController().obs;
  final accountHolderNameController = TextEditingController().obs;
  final accountNumberController = TextEditingController().obs;
  final routingNumberController = TextEditingController().obs;
  var bankDetails = BankDetailsModel().obs;
  var token = ''.obs;

  Future<void> initializeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

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
      final controller = bankNameController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  bool validateBranchName(String value) {
    value = value.trim();     // Trim input to remove leading or trailing whitespace
    final validBranchNameRegex = RegExp(r"^[a-zA-Z0-9\s\.\-']+$");   // Define regular expression for valid branch name characters (letters, numbers, spaces, dots, hyphens, and apostrophes)

    if (value.isEmpty) {
      return false;
    } else if (!validBranchNameRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  void updateBranchName(String input) {
    if (validateBranchName(input)) {
      final controller = branchNameController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
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
      final controller = accountHolderNameController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
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
      final controller = accountNumberController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
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
      final controller = routingNumberController.value;
      final previousText = controller.text;
      final previousSelection = controller.selection;

      controller.text = input;

      // Maintain cursor position
      final newSelectionOffset = previousSelection.baseOffset + (input.length - previousText.length);
      controller.selection = TextSelection.collapsed(offset: newSelectionOffset);
    }
    if (!isAnyFieldChanged.value) {
      isAnyFieldChanged.value = true;
    }
  }

  final BankingApi _bankingApi = BankingApi();
  Future<void> loadBankingDetails() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? token = prefs.getString('token') ?? '';
      BankDetailsModel? data = await _bankingApi.getBankData(token.value);

      if (data != null) {
        bankDetails.value = data;

        bankNameController.value.text = bankDetails.value.bankName ?? '';
        branchNameController.value.text = bankDetails.value.branchName ?? '';
        accountHolderNameController.value.text = bankDetails.value.accountHolderName ?? '';
        accountNumberController.value.text = bankDetails.value.accountNumber ?? '';
        routingNumberController.value.text = bankDetails.value.routingNumber ?? '';
      } else {
        Get.snackbar('Error', 'Failed to load Bank details.');
      }
    } catch (e) {
      // throw Exception('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<void> updateBankDetails(BankDetailsModel updatedDetails) async {
    try {
      landingPageController.isLoading(true);

      // Find changed fields
      Map<String, dynamic> changedFields = findChangedFields(bankDetails.value, updatedDetails);

      if (changedFields.isNotEmpty) {
        BankDetailsModel? data = await _bankingApi.updateBankDetails(changedFields, token.value);
        if (data != null) {
          bankDetails.value = data;

          bankNameController.value.text = bankDetails.value.bankName ?? '';
          branchNameController.value.text = bankDetails.value.branchName ?? '';
          accountHolderNameController.value.text = bankDetails.value.accountHolderName ?? '';
          accountNumberController.value.text = bankDetails.value.accountNumber ?? '';
          routingNumberController.value.text = bankDetails.value.routingNumber ?? '';
          Get.snackbar('Success', 'Bank details updated successfully');
        } else {
          Get.snackbar('Error', 'Failed to update bank details');
        }
      } else {
        Get.snackbar('Info', 'No changes to update');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      landingPageController.isLoading(false);
    }
  }

  Map<String, dynamic> findChangedFields(BankDetailsModel oldDetails, BankDetailsModel newDetails) {
    Map<String, dynamic> changedFields = {};

    if (oldDetails.bankName != newDetails.bankName) {
      changedFields['bank_name'] = newDetails.bankName;
    }
    if (oldDetails.branchName != newDetails.branchName) {
      changedFields['branch_name'] = newDetails.branchName;
    }
    if (oldDetails.accountHolderName != newDetails.accountHolderName) {
      changedFields['account_holder_name'] = newDetails.accountHolderName;
    }
    if (oldDetails.accountNumber != newDetails.accountNumber) {
      changedFields['account_number'] = newDetails.accountNumber;
    }
    if (oldDetails.routingNumber != newDetails.routingNumber) {
      changedFields['routing_number'] = newDetails.routingNumber;
    }

    return changedFields;
  }


  @override
  void onInit() async {
    super.onInit();
    await initializeToken();
  }

  @override
  void onClose() {
    bankNameController.value.dispose();
    branchNameController.value.dispose();
    accountHolderNameController.value.dispose();
    accountNumberController.value.dispose();
    routingNumberController.value.dispose();
    super.onClose();
  }
}