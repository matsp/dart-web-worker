import 'dart:async';
import 'dart:convert';
import 'dart:js';

import 'package:dart_web_worker/src/models/test.dart';
import 'package:dart_web_worker/src/models/worker_request.dart';
import 'package:dart_web_worker/src/models/worker_response.dart';
import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:js/js.dart';
import 'package:uuid/uuid.dart';

@anonymous
@JS()
abstract class MessageEvent {
  external String get data;
}

@JS('postMessage')
external void postMessage(obj);

@JS('onmessage')
external set onMessage(f);

void main() {
  print('Worker - created');

  final requests = StreamController<WorkerRequest>.broadcast();
  final responses = StreamController<String>.broadcast();

  onMessage = allowInterop((MessageEvent event) {
    try {
      print('Worker - got message: ${event.data}');
      final req = WorkerRequest.fromJson(jsonDecode(event.data));
      requests.sink.add(req);
    } catch (e) {
      print('Worker error: $e');
    }
  });

  // register services
  final testService = TestService();
  responses.addStream(testService.response$);

  // handle requests
  requests.stream.listen((event) {
    switch (event.type) {
      case WorkerType.test:
        testService.request$.add(event);
    }
  });

  // handle responses
  responses.stream.listen((event) {
    print('Worker - send message to UI thread: $event');
    postMessage(event);
  });
}

class TestService extends WebWorkerService {
  @override
  Future<String> perform(WorkerRequest workerRequest) async {
    final req = TestRequest.fromJson(jsonDecode(workerRequest.requestJson));
    final value = TestResponse(value: req.value.toUpperCase()).toJson();

    final res = WorkerResponse(
      id: Uuid().v4(),
      type: WorkerType.test,
      requestId: workerRequest.id,
      responseJson: jsonEncode(value),
    ).toJson();

    return jsonEncode(res);
  }
}

abstract class WebWorkerService {
  final _request = StreamController<WorkerRequest>();
  final _response = StreamController<String>.broadcast();

  Sink<WorkerRequest> get request$ => _request.sink;
  Stream<String> get response$ => _response.stream;

  WebWorkerService() {
    _request.stream.listen(
        (WorkerRequest event) async => _response.add(await perform(event)));
  }

  Future<String> perform(WorkerRequest workerRequest);
}
