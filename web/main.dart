import 'dart:html';
import 'dart:convert';

import 'package:dart_web_worker/src/models/worker_request.dart';
import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:dart_web_worker/src/models/test.dart';
import 'package:uuid/uuid.dart';

void main() {
  final worker = Worker('worker.dart.js');

  worker.onMessage.listen((event) {
    print('UI thread - got message from worker: ${event.data}');
  });

  final message = jsonEncode(
    WorkerRequest(
      id: Uuid().v4(),
      type: WorkerType.test,
      requestJson: jsonEncode(TestRequest(value: 'test').toJson()),
    ),
  );

  print('UI thread - send message to worker: $message');

  worker.postMessage(message);
}
