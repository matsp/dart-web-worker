// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerRequest _$WorkerRequestFromJson(Map<String, dynamic> json) =>
    WorkerRequest(
      id: json['id'] as String,
      type: $enumDecode(_$WorkerTypeEnumMap, json['type']),
      requestJson: json['requestJson'] as String,
    );

Map<String, dynamic> _$WorkerRequestToJson(WorkerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$WorkerTypeEnumMap[instance.type],
      'requestJson': instance.requestJson,
    };

const _$WorkerTypeEnumMap = {
  WorkerType.test: 'test',
};
