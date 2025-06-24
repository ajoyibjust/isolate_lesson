import 'dart:isolate';

Future<List<int>> calculateKvadrat(List<int> numbers) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_calculateKvadrat, [receivePort.sendPort, numbers]);
  final res = await receivePort.first;
  return res;
}

void _calculateKvadrat(List<dynamic> numbers){
SendPort sendPort = numbers[0];
List<int> n = numbers[1];
final res = n.map((e) => e * e,).toList();
sendPort.send(res);
}