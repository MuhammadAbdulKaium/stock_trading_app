import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';

class UserVerificationApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  // PATCH request to Verify User
  Future<Response> userVerification(String verificationCode) async {
    try {
      Response response = await _dio.patch(
        '${AppConstants.verifyUser}$verificationCode',  // Replace with your actual API endpoint
        options: Options(
          validateStatus: (status) {
            // Accept all status codes as valid responses (200 to 500+)
            // This prevents Dio from throwing an exception and allows you to handle them
            return status! < 500;  // Only throws exceptions for status codes >= 500
          },
        ),
      );
      
      return response;
    } catch (e) {
      throw Exception('Failed to upload photo: $e');
    }
  }

  // POST request to Resend Verification Mail
  Future<Response> sendVerificationMail(String email) async {
    try {
      Response response = await _dio.post(
        '${AppConstants.sendVerificationMail}$email',  // Replace with your actual API endpoint
        options: Options(
          validateStatus: (status) {
            // Accept all status codes as valid responses (200 to 500+)
            // This prevents Dio from throwing an exception and allows you to handle them
            return status! < 500;  // Only throws exceptions for status codes >= 500
          },
        ),
      );
      
      return response;
    } catch (e) {
      throw Exception('Failed to upload photo: $e');
    }
  }

  // POST request to Resend Verification Mail
  Future<Response> verifyAccount(String verificationCode) async {
    try {
      Response response = await _dio.post(
        '${AppConstants.verifyAccount}$verificationCode',  // Replace with your actual API endpoint
        options: Options(
          validateStatus: (status) {
            // Accept all status codes as valid responses (200 to 500+)
            // This prevents Dio from throwing an exception and allows you to handle them
            return status! < 500;  // Only throws exceptions for status codes >= 500
          },
        ),
      );
      
      return response;
    } catch (e) {
      throw Exception('Failed to upload photo: $e');
    }
  }
}