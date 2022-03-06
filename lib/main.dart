import 'package:clean_arch/features/map/ui/bloc/bloc.dart';
import 'package:clean_arch/features/map/ui/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(create: (context) => MapBloc(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MapPage.id,
      routes: {
        MapPage.id: (context) => MapPage(),
      },
    );
  }
}
