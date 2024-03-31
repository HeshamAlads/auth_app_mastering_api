import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class ErrModel {
  final int status;
  final String errorMessage;
  final List<String> error;

  ErrModel({
    required this.status,
    required this.errorMessage,
    required this.error,
  });

  factory ErrModel.fromJson(Map<String, dynamic> jsonData) => ErrModel(
        status: jsonData[ApiKey.status],
        errorMessage: jsonData[ApiKey.errorMessage],
        error: List<String>.from(jsonData[ApiKey.error].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "ErrorMessage": errorMessage,
        "Error": List<dynamic>.from(error.map((x) => x)),
      };
}
