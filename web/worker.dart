import 'dart:async';
import 'dart:js';

import 'package:dart_web_worker/src/models/worker_request.dart';
import 'package:dart_web_worker/src/models/worker_response.dart';
import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:js/js.dart';

@anonymous
@JS()
abstract class MessageEvent {
  external WorkerRequest get data;
}

@JS('postMessage')
external void PostMessage(obj);

@JS('onmessage')
external void set onMessage(f);

void main() {
  print('Worker - created');

  final data$ = StreamController<WorkerRequest>.broadcast();
  final results$ = StreamController<WorkerResponse>.broadcast();

  onMessage = allowInterop((MessageEvent event) => data$.sink.add(WorkerRequest.fromJson(event.data, );
   

  final fibonacciService = FibonacciService();
  results$.addStream(fibonacciService.response$);

  data$.stream.listen((event) {
    print(event);
  });

  results$.stream.listen((event) {});

  // service.result$.listen((event) {
  //   PostMessage(event);
  // });
  // 'allowInterop' is necessary to pass a function into js.
  // onMessage = allowInterop((event) {
  //   var e = event as MessageEvent;

  //   // print('Worker - event: ${e.data}');
  //   PostMessage(fib(int.parse(e.data)).toString());
  // });
}

class FibonacciService extends WebWorkerService<int> {
  @override
  Future<WorkerResponse<int>> perform(int data) async => WorkerResponse(
        id: '1',
        requestId: 'todo', // TODO: how to obtain?!
        type: WorkerType.fibonacci,
        data: fib(data),
      );
}

abstract class WebWorkerService<T> {
  final _data = StreamController<T>();
  final _response = StreamController<WorkerResponse>();

  Sink<T> get data$ => _data.sink;
  Stream<WorkerResponse> get response$ => _response.stream;

  WebWorkerService() {
    _data.stream.listen((T event) async {
      final result = await perform(event);
      _response.add(result);
    });
  }

  Future<WorkerResponse<T>> perform(T data);
}

int fib(int n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2) + fib(n - 1); //recursive case
}
