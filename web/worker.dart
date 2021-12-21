import 'dart:async';
import 'dart:js';

import 'package:js/js.dart';

@anonymous
@JS()
abstract class MessageEvent {
  external dynamic get data;
}

@JS('postMessage')
external void PostMessage(obj);

@JS('onmessage')
external void set onMessage(f);

@JS('JSON.stringify')
external String stringify(Object obj);

void main() {
  print('Worker - created');

  final data$ = StreamController<dynamic>.broadcast();
  final results$ = StreamController<WorkerResult>.broadcast();

  onMessage = allowInterop((event) => data$.sink.add(event.data));

  final fibonacciService = FibonacciService();
  results$.addStream(fibonacciService.result$);

  data$.stream.listen((event) {
    final e = JsObject.jsify(event);
    if (e.hasProperty('type') && e.hasProperty('data')) {
      switch (e['type']) {
        case 'fibonacci':
          fibonacciService.data$.add(e['data']);
          break;
      }
    }
  });

  results$.stream.listen((event) {
    PostMessage(stringify({
      'type': 'fibonacci',
      'result': (event as FibonacciWorkerResult).n.toString()
    }));
  });

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

class FibonacciService extends WebWorkerService<String, FibonacciWorkerResult> {
  @override
  Future<FibonacciWorkerResult> perform(String data) async =>
      FibonacciWorkerResult(n: fib(int.parse(data)));
}

abstract class WebWorkerService<T, R> {
  final StreamController<T> _data = StreamController<T>();
  final StreamController<R> _result = StreamController<R>();

  Sink<T> get data$ => _data.sink;
  Stream<R> get result$ => _result.stream;

  WebWorkerService() {
    _data.stream.listen((T event) async {
      final result = await perform(event);
      _result.add(result);
    });
  }

  Future<R> perform(T data);
}

int fib(int n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2) + fib(n - 1); //recursive case
}

abstract class WorkerResult {}

class FibonacciWorkerResult extends WorkerResult {
  final int n;

  FibonacciWorkerResult({required this.n});
}

class RandomWorkerResult implements WorkerResult {
  final int number;

  const RandomWorkerResult({required this.number});
}

enum WorkerDataType {
  fibonacci,
  random,
}
