import 'dart:isolate';

Future<Map> wordsCount(String str) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_wordsCount, [receivePort.sendPort, str]);
  final res = await receivePort.first as Map;
  return res;
}

void _wordsCount(List<dynamic> str) {
  SendPort sendPort = str[0];
  String s = str[1];


  List<String> words = s.toLowerCase().split(" ");

  Map res = {};

  for (String word in words) {
    res[word] = (res[word] ?? 0) + 1;
  }





  sendPort.send(res);
}
