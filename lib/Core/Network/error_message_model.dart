import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  bool success;

  ErrorMessageModel(
      {required this.statusCode,
        required this.statusMessage,
        required this.success});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [success, statusCode, statusMessage];
}
