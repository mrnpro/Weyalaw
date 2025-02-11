class Simulate {
  static delay() async {
    await Future.delayed(
        const Duration(seconds: 3)); // Simulate a delay of 1 second
  }
}
