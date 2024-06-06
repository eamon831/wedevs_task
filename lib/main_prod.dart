import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/session_manager/session_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager().init();
  await initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final EnvConfig prodConfig = EnvConfig(
    appName: 'WeDevs Task Prod',
    baseUrl: 'https://apptest.dokandemo.com/wp-json/',
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.production,
    envConfig: prodConfig,
  );
  final prefs = SessionManager();
  final lang = await prefs.getLanguage();

  runApp(
    MyApp(
      lang: lang,
    ),
  );
}
