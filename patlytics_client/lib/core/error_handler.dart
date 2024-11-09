import 'package:dio/dio.dart';

handleError(error) {
  // Handle DioError specifically
  if (error is DioException) {
    if (error.type == DioExceptionType.badResponse) {
      throw error.response?.data?['message'];
    } else if (error.type == DioExceptionType.connectionTimeout) {
      throw Exception('Connection timed out');
    } else if (error.type == DioExceptionType.receiveTimeout) {
      throw Exception('Receive timeout');
    } else if (error.type == DioExceptionType.unknown) {
      throw Exception('Unknown error');
    }
  }
  return error;
}
