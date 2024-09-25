import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class ProductsToInvestApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  Future<Response> getAllProduct(String token) async {
    try {
      Response response = await _dio.get(
        AppConstants.getAllProductToInvest,  // Replace with your actual API endpoint
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      
      return response;
    } catch (e) {
      throw Exception('Failed to upload photo: $e');
    }
  }
}