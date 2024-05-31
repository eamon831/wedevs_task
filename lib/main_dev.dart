import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final EnvConfig devConfig = EnvConfig(
    appName: 'WeDevs Task Dev',
    baseUrl: 'http://apptest.dokandemo.com/wp-json/',
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
