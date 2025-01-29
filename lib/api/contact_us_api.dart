import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class ContactUsApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  Future<Response> contactUs(String name, String email, String phone, String message, String token) async {
    try {
      Response response = await _dio.post(
        AppConstants.contactUsEndpoint,  // Replace with your actual API endpoint
        data: {'name': name, 'email': email, 'phone': phone, 'message': message},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          validateStatus: (status) {
            // Accept all status codes as valid responses (200 to 500+)
            // This prevents Dio from throwing an exception and allows you to handle them
            return status! < 500;  // Only throws exceptions for status codes >= 500
          },
        ),
      );

      return response;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}