import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class AuthAPI {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> authenticateUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '${AppConstants.baseUrl}${AppConstants.loginEndpoint}', 
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data; 
      } else {
        throw Exception('Incorrect EMAIL or PASSWORD');
      }
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }
}