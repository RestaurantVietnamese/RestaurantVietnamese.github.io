import 'flavor/flavor_config.dart';
import 'main.dart' as app;

Future<void> main() async {
  FlavorConfig.setEnvironment('DEV');
  await app.main();
}
