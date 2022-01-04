import 'dart:html';
import 'dart:convert';

import 'package:dart_web_worker/src/models/worker_request.dart';
import 'package:dart_web_worker/src/models/worker_type.dart';
import 'package:uuid/uuid.dart';

import 'worker.dart';

void main() {
  final worker = Worker('worker.dart.js');

  worker.onMessage.listen((event) {
    print('ui thread - got message from worker: ${event.data}');
  });

  // Future.delayed(Duration(seconds: 3), () => worker.postMessage('hello'));
  // worker.postMessage({'type': 'fibonacci'});
  // worker.postMessage(<String, String>{'type': 'fibonacci', 'data': '10'});
  worker.postMessage(
    jsonEncode(
      WorkerRequest<int>(
        id: Uuid().v4(),
        request: 10,
      ).toJson(jsonEncode),
    ),
  );
}
