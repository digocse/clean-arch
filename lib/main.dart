import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import './features/core/app_router.dart';
import './features/core/injection_container.dart' as di;

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    await di.initInjectionContainer();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }, (error, stack) => {});
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: _appRouter.onGeneratedRoute);
  }
}
