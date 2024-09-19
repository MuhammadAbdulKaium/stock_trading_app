import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class AuthAPI {
  final Dio _dio = Dio();

  Future<Response> authenticateUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '${AppConstants.baseUrl}${AppConstants.loginEndpoint}', 
        data: {'email': email, 'password': password},
        options: Options(
          validateStatus: (status) {
            // Accept all status codes as valid responses (200 to 500+)
            // This prevents Dio from throwing an exception and allows you to handle them
            return status! < 500;  // Only throws exceptions for status codes >= 500
          },
        ),
      );
      
      return response;
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }
}