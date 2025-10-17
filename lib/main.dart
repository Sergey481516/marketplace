import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:marketplace/config/theme/theme.dart';
import 'package:marketplace/config/router.dart';
import 'package:marketplace/config/injection/injection_container.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marketplace',
      theme: theme,
      routerConfig: router,
    );
  }
}
