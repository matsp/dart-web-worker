import 'package:json_annotation/json_annotation.dart';

part 'worker_response.g.dart';

@JsonSerializable()
class WorkerResponse<T> {
  final String id;
  final String requestId;
  final T response;
  final List<WorkerResponseError>? errors;

  const WorkerResponse({
    required this.id,
    required this.requestId,
    required this.response,
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

