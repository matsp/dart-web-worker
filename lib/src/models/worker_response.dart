import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'worker_response.g.dart';

@JsonSerializable()
class WorkerResponse {
  final String id;
  final WorkerType type;
  final String requestId;
  final String? responseJson;
  final List<WorkerResponseError>? errors;

  const WorkerResponse({
    required this.id,
    required this.type,
    required this.requestId,
    this.responseJson,
    this.errors,
  });

  factory WorkerResponse.fromJson(dynamic json) =>
      _$WorkerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerResponseToJson(this);
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
