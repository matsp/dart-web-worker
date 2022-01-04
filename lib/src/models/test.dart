import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

@JsonSerializable()
class TestRequest {
  final String value;

  const TestRequest({required this.value});

  Map<String, dynamic> toJson() => _$TestRequestToJson(this);

  factory TestRequest.fromJson(dynamic json) => _$TestRequestFromJson(json);
}

@JsonSerializable()
class TestResponse {
  final String value;

  const TestResponse({required this.value});

  Map<String, dynamic> toJson() => _$TestResponseToJson(this);

  factory TestResponse.fromJson(dynamic json) => _$TestResponseFromJson(json);
}
