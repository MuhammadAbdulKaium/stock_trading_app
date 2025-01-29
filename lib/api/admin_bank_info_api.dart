import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/constant/app_constants.dart';
import 'package:stock_trading_app/models/admin_bank_info_model.dart';

class AdminBankInfoApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  // GET request to GET Admin bank details
  Future<AdminBankInfoModel?> getAdminBankInfo(String token) async {
    try {
      final response = await _dio.get(
        AppConstants.getAdminBankInfoEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return AdminBankInfoModel.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to fetch info.');
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch info.');
      return null;
    }
  }
}