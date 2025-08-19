import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup DI
  await setupServiceLocator();

  // (Optional) Setup HydratedBloc storage here
  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  // HydratedBlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  //   storage: storage,
  // );

  runApp(const MyApp());
}
