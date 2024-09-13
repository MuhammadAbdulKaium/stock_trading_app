import 'package:dio/dio.dart';
import 'package:stock_trading_app/constant/app_constants.dart';
import 'package:stock_trading_app/models/nominee_details_model.dart';

class NomineeApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl, // Replace with your actual API base URL
    connectTimeout: const Duration(milliseconds: 7000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  // GET request to GET Nominee details
  Future<NomineeDetailsModel?> getNomineeData(String token) async {
    try {
      final response = await _dio.get(
        AppConstants.getNomineeInfoEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return NomineeDetailsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // PATCH request to update Nominee details
  Future<NomineeDetailsModel?> updateNomineeDetails(Map<String, dynamic> updatedFields, String token) async {
    try {
      print('updatedFields====================');
      print(updatedFields);
      print('token====================');
      print(token);
      final response = await _dio.patch(
        AppConstants.updateNomineeInfoEndpoint,
        data: updatedFields,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('response====================');
      print(response);

      if (response.statusCode == 200) {
        return NomineeDetailsModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
    // Handling DioException specifically
      if (e.response != null) {
        print('DioException response status code: ${e.response?.statusCode}');
        print('DioException response data: ${e.response?.data}');
      } else {
        print('DioException error: ${e.message}');
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}