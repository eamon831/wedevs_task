import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final EnvConfig prodConfig = EnvConfig(
    appName: 'WeDevs Task Prod',
    baseUrl: 'http://apptest.dokandemo.com/wp-json/',
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.production,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
