import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'worker_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class WorkerResponse<T> {
  final String id;
  final String requestId;
  final WorkerType type;
  final T? data;
  final List<WorkerResponseError>? errors;

  const WorkerResponse({
    required this.id,
    required this.requestId,
    required this.type,
    this.data,
    this.errors,
  });

  factory WorkerResponse.fromJson(dynamic json, T Function(Object? json) fromJsonT) =>
      _$WorkerResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$WorkerResponseToJson(this, toJsonT);
}

@JsonSerializable()
class WorkerResponseError {
  final String id;
  final String message;

  const WorkerResponseError({
    required this.id,
    required this.message,
  });

  factory WorkerResponseError.fromJson(dynamic json) =>
      _$WorkerResponseErrorFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerResponseErrorToJson(this);
}

