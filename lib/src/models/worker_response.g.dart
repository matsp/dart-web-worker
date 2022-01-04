// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerResponse _$WorkerResponseFromJson(Map<String, dynamic> json) =>
    WorkerResponse(
      id: json['id'] as String,
      requestId: json['requestId'] as String,
      responseJson: json['responseJson'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => WorkerResponseError.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$WorkerResponseToJson(WorkerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestId': instance.requestId,
      'responseJson': instance.responseJson,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };

WorkerResponseError _$WorkerResponseErrorFromJson(Map<String, dynamic> json) =>
    WorkerResponseError(
      id: json['id'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$WorkerResponseErrorToJson(
        WorkerResponseError instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };
