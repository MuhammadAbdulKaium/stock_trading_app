import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';
import 'package:stock_trading_app/models/personal_details_model.dart';

class PersonalApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  // GET request to GET Personal details
  Future<PersonalDetailsModel?> getPersonalData(String userId, String token) async {
    try {
      final response = await _dio.get(
        '/api/users/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return PersonalDetailsModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // PATCH request to update Personal details
  Future<PersonalDetailsModel?> updatePersonalDetails(Map<String, dynamic> updatedFields, String token) async {
    try {
      final response = await _dio.patch(
        AppConstants.updatePersonalInfoEndpoint,
        data: updatedFields,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return PersonalDetailsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}