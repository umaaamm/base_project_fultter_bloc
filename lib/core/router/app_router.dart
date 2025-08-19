import 'package:flutter/material.dart';
import '../../features/counter/presentation/pages/counter_page.dart';

class AppRouter {
  static const String counter = '/counter';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
      default:
        return MaterialPageRoute(builder: (_) => const CounterPage());
    }
  }
}