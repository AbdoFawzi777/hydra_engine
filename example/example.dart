import 'package:hydra_engine/hydra_engine.dart';

void main() async {
  final engine = HydraEngine();
  await engine.initialize();
  print('HydraEngine is ready for tactical operations.');
}
