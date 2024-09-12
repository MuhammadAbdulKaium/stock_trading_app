import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';
import 'package:stock_trading_app/models/bank_details_model.dart';

class BankingApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  // GET request to GET bank details
  Future<BankDetailsModel?> getBankData(String token) async {
    try {
      final response = await _dio.get(
        AppConstants.getMyBankInfoEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return BankDetailsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // PATCH request to update bank details
  Future<BankDetailsModel?> updateBankDetails(Map<String, dynamic> updatedFields, String token) async {
    try {
      final response = await _dio.patch(
        AppConstants.updateBankInfoEndpoint,
        data: updatedFields,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return BankDetailsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}