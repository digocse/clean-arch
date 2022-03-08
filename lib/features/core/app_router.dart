import 'package:clean_arch/features/map/ui/pages/map_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MapPage());
      default:
        throw ArgumentError('Inexistent route: ${routeSettings.name}');
    }
  }
}
