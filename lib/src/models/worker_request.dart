import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'worker_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class WorkerRequest<T> {
  final String id;
  final WorkerType type;
  final T data;

  const WorkerRequest({
    required this.id,
    required this.type,
    required this.data,
  });

  factory WorkerRequest.fromJson(
          dynamic json, T Function(Object? json) fromJsonT) =>
      _$WorkerRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$WorkerRequestToJson(this, toJsonT);
}
