import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'worker_request.g.dart';

@JsonSerializable()
class WorkerRequest {
  final String id;
  final WorkerType type;
  final String requestJson;

  const WorkerRequest({
    required this.id,
    required this.type,
    required this.requestJson,
  });

  factory WorkerRequest.fromJson(dynamic json) => _$WorkerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerRequestToJson(this);
}
