import 'dart:async';

import 'package:clean_arch/features/map/ui/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch/features/core/injection_container.dart' as di;

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    await di.initInjectionContainer();
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stack) => {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MapPage.id,
      routes: {
        MapPage.id: (context) => const MapPage(),
      },
    );
  }
}
