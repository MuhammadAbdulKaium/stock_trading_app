import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class CreateAccountAPI {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> createAccount({required String fullName, required String email, required String password}) async {

    try {
      final response = await _dio.post(
        '${AppConstants.baseUrl}${AppConstants.signUpEndpoint}', 
        data: {'fullname': fullName, 'email': email, 'password': password},
      );

      // print('Response status: ${response.statusCode}');
      // print('Response data: ${response.data}');
      // print('${AppConstants.baseUrl}${AppConstants.loginEndpoint}');

      if (response.statusCode == 201) {
        // print('==============');
        // print(response.data);
        return response.data; 
      } else if (response.statusCode == 401) {
        // Unauthorized, specific message from the API
        // print('--------------------');
        // print('Unauthorized: ${response.data}');
        throw Exception('Unauthorized: ${response.data}');
      } else {
        // Handle other status codes
        // print('####################');
        // print('Unexpected error: ${response.statusCode}');
        throw Exception('Error: ${response.data}');
      }
    } catch (error) {
      // print('++++++++++++++++++++');
      // print('Error=========: $error');
      throw Exception('Error during login: $error');
    }
  }
}