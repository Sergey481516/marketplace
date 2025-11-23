import 'dart:async';

import 'package:stack_trace/stack_trace.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:marketplace/core/app/app_root.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'firebase_options.dart';

Future<void> main() async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load(fileName: '.env');
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await configureDependencies();

      runApp(const AppRoot());
    },
    (error, stack) {
      final trace = Trace.from(stack);
      debugPrint('❌ Uncaught error: $error\n${trace.terse}');
    },
  );
}
