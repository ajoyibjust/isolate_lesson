import 'dart:isolate';

Future<String> reverseIsolate(String str) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_reverse, [receivePort.sendPort, str]);
  final res = await receivePort.first as String;
  return res;
}

void _reverse(List<dynamic> str) {
  SendPort sendPort = str[0];
  String s = str[1];
  final res = s.split('').reversed.join();
  sendPort.send(res);
}
