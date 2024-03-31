import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrModel errModel;
  const ServerException({required this.errModel});
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.cancel:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.connectionError:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.unknown:
      throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad Requst
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
        case 401: // unauthorized
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
        case 403: // Forbidden
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
        case 404: // Not Found
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
        case 409: // cofficient
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
        case 422: // Unprocessable Entity
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
        case 504: // Server Exception
          throw ServerException(errModel: ErrModel.fromJson(e.response?.data));
      }
  }
}
