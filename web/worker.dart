import 'dart:async';
import 'dart:convert';
import 'dart:js';

import 'package:dart_web_worker/src/models/worker_request.dart';
import 'package:dart_web_worker/src/models/worker_response.dart';
import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:js/js.dart';
import 'package:uuid/uuid.dart';
import 'package:rxdart/rxdart.dart';

@anonymous
@JS()
abstract class MessageEvent {
  external String get data;
}

@JS('postMessage')
external void PostMessage(obj);

@JS('onmessage')
external void set onMessage(f);

void main() {
  print('Worker - created');

  final requests = StreamController<WorkerRequest>.broadcast();
  final responses = StreamController<WorkerResponse>.broadcast();

  onMessage = allowInterop((MessageEvent event) {
    try {
      final req = WorkerRequest.fromJson(jsonDecode(event.data),
          (dynamic obj) => jsonDecode(obj));

      requests.sink.add(req);
    } catch (e) {
      print(e);
    }
  });

  final fibonacciService = FibonacciService();
  // responses$.addStream(fibonacciService.response$);
  fibonacciService.response$.listen(
    (event) {
      print(event);
    },
  );

  requests.stream
      // .whereType<WorkerRequest<int>>()
      // .where((event) => event is WorkerRequest<int>)
      .listen((event) => print(event));

  requests.stream.listen((event) {
    // TODO
  });

  responses.stream.listen((event) {
    // TODO
  });
}

class FibonacciService extends WebWorkerService<int, int> {
  @override
  Future<WorkerResponse<int>> perform(WorkerRequest<int> workerRequest) async =>
      WorkerResponse(
        id: Uuid().v4(),
        requestId: workerRequest.id,
        response: fib(workerRequest.request),
      );
}

abstract class WebWorkerService<R, S> {
  final _request = StreamController<WorkerRequest<R>>();
  final _response = StreamController<WorkerResponse<S>>();

  Sink<WorkerRequest<R>> get request$ => _request.sink;
  Stream<WorkerResponse<S>> get response$ => _response.stream;

  WebWorkerService() {
    _request.stream.listen(
        (WorkerRequest<R> event) async => _response.add(await perform(event)));
  }

  Future<WorkerResponse<S>> perform(WorkerRequest<R> workerRequest);
}

int fib(int n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2) + fib(n - 1); //recursive case
}
