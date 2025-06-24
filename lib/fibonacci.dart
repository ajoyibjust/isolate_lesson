import 'dart:isolate';

Future<int> fibonacciIsolate(int number) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(_fibonacciIsolate, [receivePort.sendPort, number]);

  final res = await receivePort.first as int;
  return res;
}

void _fibonacciIsolate(List<dynamic> num) {
  SendPort sendPort = num[0];
  int n = num[1];

  int res = _fibonacci(n);
  sendPort.send(res);
}

_fibonacci(int n) {
  int a = 0, b = 1, c = 0;
  for (int i = 2; i <= n; i++) {
    c = a + b;
    a = b;
    b = c;
  }
  return c;
}
