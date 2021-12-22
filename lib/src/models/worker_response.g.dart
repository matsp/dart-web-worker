// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerResponse<T> _$WorkerResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    WorkerResponse<T>(
      id: json['id'] as String,
      requestId: json['requestId'] as String,
      response: fromJsonT(json['response']),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => WorkerResponseError.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$WorkerResponseToJson<T>(
  WorkerResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'requestId': instance.requestId,
      'response': toJsonT(instance.response),
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
