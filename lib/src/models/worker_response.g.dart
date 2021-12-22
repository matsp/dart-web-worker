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
      response: _$nullableGenericFromJson(json['response'], fromJsonT),
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
      'response': _$nullableGenericToJson(instance.response, toJsonT),
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

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
