import 'dart:async';
import 'dart:html';

void main() {
  final worker = Worker('worker.dart.js');

  worker.onMessage.listen((event) {
    print('ui thread - got message from worker: ${event.data}');
  });

  Future.delayed(Duration(seconds: 3), () => worker.postMessage('45'));
}
