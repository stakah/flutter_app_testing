// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:flutter_app_testing/counter/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}
