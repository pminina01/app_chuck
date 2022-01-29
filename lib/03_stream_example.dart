Future<void> main() async {
  stream().listen(
    (event) {
      print(event); // handle elements
    },
    onError: (e) {
      print(e); // handle an error
    },
  );
}

Stream<int> stream() => Stream<int>.periodic(
    const Duration(milliseconds: 500), (int event) => event);
