import 'dart:io';

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
      final response = await _dio.patch(
        AppConstants.updateNomineeInfoEndpoint,
        data: updatedFields,
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
    } on DioException catch (e) {
    // Handling DioException specifically
      if (e.response != null) {
        // print('DioException response status code: ${e.response?.statusCode}');
        // print('DioException response data: ${e.response?.data}');
        throw Exception('Failed to upload photo: $e');
      } else {
        // print('DioException error: ${e.message}');
      }
      return null;
    } catch (e) {
      // print('Error: $e');
      return null;
    }
  }

  // PATCH request to update Nid picture
  Future<Response> updateNidPhoto(File file, String token) async {
    String fileName = file.path.split('/').last;

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    try {
      Response response = await _dio.patch(
        AppConstants.updateNomineeNid,  // Replace with your actual API endpoint
        data: formData,
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