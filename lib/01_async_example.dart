import 'dart:async';

void main() {
  //future();
  async();
}

void future() {
  var counter = 0;
  final timer =
      Timer.periodic(const Duration(seconds: 1), (_) => print(counter++));
  Future.delayed(const Duration(seconds: 10)).then((_) {
    print('Finished');
    timer.cancel();
  });
}

void async() async {
  var counter = 0;
  final timer =
      Timer.periodic(const Duration(seconds: 1), (_) => print(counter++));
  await Future.delayed(const Duration(seconds: 10));
  print('Finished');
  timer.cancel();
}
