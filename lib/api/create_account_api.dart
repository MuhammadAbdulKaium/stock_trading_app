import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class CreateAccountAPI {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  Future<Map<String, dynamic>> createAccount({required String fullName, required String email, required String password}) async {
    try {
      final response = await _dio.post(
        AppConstants.signUpEndpoint, 
        data: {'fullname': fullName, 'email': email, 'password': password},
      );

      // '${AppConstants.baseUrl}${AppConstants.signUpEndpoint}',
      // print('Response status: ${response.statusCode}');
      // print('Response data: ${response.data}');
      // print('${AppConstants.baseUrl}${AppConstants.loginEndpoint}');

      if (response.statusCode == 201) {
        return response.data; 
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }

  // // PATCH request to Verify User
  // Future<Response> userVerification(String verificationCode) async {
  //   try {
  //     Response response = await _dio.patch(
  //       '${AppConstants.verifyUser}$verificationCode',  // Replace with your actual API endpoint
  //       // data: formData,
  //       // options: Options(
  //       //   headers: {
  //       //     "Authorization": "Bearer $token",
  //       //     "Content-Type": "multipart/form-data",
  //       //   },
  //       // ),
  //     );
      
  //     return response;
  //   } catch (e) {
  //     throw Exception('Failed to upload photo: $e');
  //   }
  // }
}