import 'package:model/input.dart';

import 'package:test/test.dart';

void main() {
  test('try edit values', () {
    final testValue = Input("", 0.0, "units");

    expect(testValue.buyQnt, equals(0.0));
  });
}
