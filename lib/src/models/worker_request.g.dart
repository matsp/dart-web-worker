// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerRequest<T> _$WorkerRequestFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    WorkerRequest<T>(
      id: json['id'] as String,
      type: $enumDecode(_$WorkerTypeEnumMap, json['type']),
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$WorkerRequestToJson<T>(
  WorkerRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$WorkerTypeEnumMap[instance.type],
      'data': toJsonT(instance.data),
    };

const _$WorkerTypeEnumMap = {};