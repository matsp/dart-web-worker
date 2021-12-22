import 'package:json_annotation/json_annotation.dart';

part 'worker_request.g.dart';

@JsonSerializable()
class WorkerRequest<T> {
  final String id;
  final T request;

  const WorkerRequest({
    required this.id,
    required this.request,
  });

  factory WorkerRequest.fromJson(
          dynamic json, T Function(Object? json) fromJsonT) =>
      _$WorkerRequestFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$WorkerRequestToJson<T>(this, toJsonT);
}
