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

void main() {
  print('Worker - created');

  // 'allowInterop' is necessary to pass a function into js.
  onMessage = allowInterop((event) {
    var e = event as MessageEvent;

    // print('Worker - event: ${e.data}');
    PostMessage(fib(int.parse(e.data)).toString());
  });
}

int fib(int n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2) + fib(n - 1); //recursive case
}
