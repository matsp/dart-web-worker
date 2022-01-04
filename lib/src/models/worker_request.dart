import 'package:json_annotation/json_annotation.dart';

part 'worker_request.g.dart';

@JsonSerializable()
class WorkerRequest {
  final String id;
  final String request;

  const WorkerRequest({
    required this.id,
    required this.request,
  });

  factory WorkerRequest.fromJson(dynamic json) => _$WorkerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerRequestToJson(this);
}
