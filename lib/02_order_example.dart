
Future<void> main() async {
  foo1('1');
  foo1('2');
  foo2('3', 3);
  foo2('4', 2);
  await foo2('5', 1);
  foo1('6');
}

void foo1(String arg) {
  print('foo1: $arg');
}

Future<void> foo2(String arg, int delay) async {
  print('foo2: $arg');
  await Future.delayed(Duration(seconds: delay));
  print('foo2: $arg — completed');
}