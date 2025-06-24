import 'dart:isolate';

Future<List<int>> uniqueNumberIsolate(List<int> numbers) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_uniqueNumber, [receivePort.sendPort, numbers]);
  final res = await receivePort.first;
  return res;
}

void _uniqueNumber(List<dynamic> numbers){
SendPort sendPort = numbers[0];
List<int> n = numbers[1];
final res = n.toSet().toList();
sendPort.send(res);
}