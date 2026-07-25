import 'package:flutter_test/flutter_test.dart';
import 'package:hydra_engine/hydra_engine.dart';

void main() {
  test('HydraEngine initialization test', () async {
    final engine = HydraEngine();
    await engine.initialize();
    expect(engine.isInitialized, true);
  });
}
