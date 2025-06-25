import 'dart:isolate';

Future<List> onlineNumber(String str) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_onlineNumber, [receivePort.sendPort, str]);
  final res = await receivePort.first as List;
  return res;
}

void _onlineNumber(List<dynamic> str) {
  SendPort sendPort = str[0];
  String s = str[1];
 final matches = RegExp(r'\d+').allMatches(s);
  final res = matches.map((e) => int.parse(e.group(0)!)).toList();
  sendPort.send(res);
}
