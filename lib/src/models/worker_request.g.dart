// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerRequest _$WorkerRequestFromJson(Map<String, dynamic> json) =>
    WorkerRequest(
      id: json['id'] as String,
      request: json['request'] as String,
    );

Map<String, dynamic> _$WorkerRequestToJson(WorkerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.request,
    };
