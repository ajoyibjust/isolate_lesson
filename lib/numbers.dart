import 'dart:isolate';

Future<int> calculateSum(List<int> num) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_sum, [receivePort.sendPort, num]);

  final sum = await receivePort.first as int;
  return sum;
}


void _sum(List<dynamic> numbers){
  SendPort sendPort = numbers[0];
  List<int> n = numbers[1];
  final res = n.fold(0, (a, b) => a + b,);
  sendPort.send(res);
}